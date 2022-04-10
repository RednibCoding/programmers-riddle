import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../cell.dart';
import '../game_page.dart';
import '../state/game_state.dart';

class GameController {
  static void initialize() {
    _initTable();
    resetTimer();
    startTimer();
  }

  static void dispose() {
    stopTimer(reset: false);
  }

  static Future<bool> onPopScope() async {
    _reset();
    stopTimer(reset: false);
    return true;
  }

  static List<int> _genNumbers(int howMany, int randFrom, int randTo) {
    var rng = Random();
    var l = List.generate(howMany, (_) => rng.nextInt(randTo - randFrom) + randFrom);
    return l;
  }

  static List<DataCell> _makeRowCells(int numColumns, int numNibblesPerRow) {
    double size = numColumns <= 4 ? 52 : 32;
    double fontSize = numColumns <= 4 ? 18 : 12;
    var list = List.generate(numColumns, (_) => DataCell(Cell(onTap: _onTap, size: size, fontSize: fontSize)));
    var numbers = _genNumbers(numNibblesPerRow, 1, 15);
    var numberStr = " ";
    for (final number in numbers) {
      numberStr += _decDigitToHexDigit(number);
    }
    numberStr += " ";
    var cells = [
      DataCell(Text(numberStr, style: TextStyle(fontSize: fontSize))),
      ...list,
    ];
    gameState.numbers.addAll(numbers);
    return cells;
  }

  static void _initTable() {
    gameState.numbers.clear();
    gameState.numNibblesPerRow = gameState.numColumns ~/ 4;
    gameState.cols = List.generate(gameState.numColumns + 1, (_) => DataColumn(label: Container()));
    gameState.rows = List.generate(
      gameState.numColumns,
      (_) => DataRow(
        cells: _makeRowCells(gameState.numColumns, gameState.numNibblesPerRow),
      ),
    );
  }

  static Widget makeTable(BuildContext context, int numColumns) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: DataTable(
        showBottomBorder: true,
        columnSpacing: 4,
        dataRowHeight: 56,
        headingRowHeight: 0,
        dividerThickness: 0,
        border: TableBorder.all(color: Colors.transparent),
        horizontalMargin: 0,
        columns: [...gameState.cols],
        rows: [...gameState.rows],
      ),
    );
  }

  static String _decDigitToHexDigit(int decimal) {
    if (decimal > 0 && decimal < 10) {
      return decimal.toString();
    } else if (decimal == 10) {
      return "A";
    } else if (decimal == 11) {
      return "B";
    } else if (decimal == 12) {
      return "C";
    } else if (decimal == 13) {
      return "D";
    } else if (decimal == 14) {
      return "E";
    } else if (decimal == 15) {
      return "F";
    } else {
      return "";
    }
  }

  static int _hexDigitToDecDigit(String hex) {
    if (hex == "A") {
      return 10;
    } else if (hex == "B") {
      return 11;
    } else if (hex == "C") {
      return 12;
    } else if (hex == "D") {
      return 13;
    } else if (hex == "E") {
      return 14;
    } else if (hex == "F") {
      return 15;
    } else {
      return int.tryParse(hex) ?? 0;
    }
  }

  static void _onTap() {
    if (_isBoardFinished()) {
      _reset();
      Navigator.popUntil(gamePageKey.currentContext!, (route) => route.isFirst);
      Navigator.pushNamed(gamePageKey.currentContext!, "/finish");
      return;
    }
  }

  static void onBtnBackClick() {
    _reset();
    Navigator.popUntil(gamePageKey.currentContext!, (route) => route.isFirst);
  }

  static bool _isBoardFinished() {
    for (final row in gameState.rows) {
      if (!_isRowFinished(row)) return false;
    }
    return true;
  }

  static bool _isRowFinished(DataRow row) {
    final numberCell = row.cells[0].child as Text;
    var rowNumber = numberCell.data ?? "0";

    var numCells = row.cells.length;
    var numNibbles = numCells ~/ 4;

    for (var i = 1; i <= numNibbles; i++) {
      var cell1 = row.cells[i].child as Cell;
      var cell2 = row.cells[i + 1].child as Cell;
      var cell3 = row.cells[i + 2].child as Cell;
      var cell4 = row.cells[i + 3].child as Cell;

      var nibble = [cell1.value, cell2.value, cell3.value, cell4.value];
      var intValue = rowNumber[i] == " " ? 0 : _hexDigitToDecDigit(rowNumber[i]);

      if (!_isNibbleFinished(nibble, intValue)) return false;
    }
    return true;
  }

  static bool _isNibbleFinished(List<int> nibble, int intValue) {
    assert(nibble.length == 4, "Nibble must have 4 elements");
    return _nibbleToInt(nibble) == intValue;
  }

  static int _nibbleToInt(List<int> nibble) {
    assert(nibble.length == 4, "Nibble must have 4 elements");
    var intValue = 0;
    for (var i = 0; i < 4; i++) {
      intValue += nibble[i] * pow(2, 3 - i).toInt();
    }
    return intValue;
  }

  static void startTimer() {
    gameState.elapsedTimeStr = "00:00:00";
    gameState.timer = Timer.periodic(const Duration(seconds: 1), (_) => _updateTime());
  }

  static void resetTimer() {
    gameState.duration = const Duration(seconds: 0);
  }

  static void stopTimer({bool reset = false}) {
    if (reset) {
      resetTimer();
    }
    gameState.timer?.cancel();
  }

  static void _reset() {
    stopTimer();
    gameState.numbers.clear();
    gameState.rows.clear();
  }

  static void _updateTime() {
    final seconds = gameState.duration.inSeconds + 1;
    gameState.duration = Duration(seconds: seconds);
    gameState.elapsedTimeStr = _timerTimeAsStr();
  }

  static String _timerTimeAsStr() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(gameState.duration.inHours);
    final minutes = twoDigits(gameState.duration.inMinutes.remainder(60));
    final seconds = twoDigits(gameState.duration.inSeconds.remainder(60));

    return "$hours:$minutes:$seconds";
  }
}
