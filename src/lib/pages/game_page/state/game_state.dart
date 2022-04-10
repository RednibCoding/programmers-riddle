import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'game_state.g.dart';

class GameState = _GameStateBase with _$GameState;

final GameState gameState = GameState();

enum BoardSize {
  small,
}

abstract class _GameStateBase with Store {
  @observable
  bool isUpdating = false;

  @observable
  BoardSize boardSize = BoardSize.small;

  @observable
  String elapsedTimeStr = "";

  Timer? timer;
  Duration duration = const Duration();

  List<DataRow> rows = [];
  List<DataColumn> cols = [];
  int numNibblesPerRow = 0;
  List<int> numbers = [];

  int get numColumns {
    switch (boardSize) {
      case BoardSize.small:
        return 4;
    }
  }
}
