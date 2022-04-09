import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'game_state.g.dart';

class GameState = _GameStateBase with _$GameState;

final GameState gameState = GameState();

enum BoardSize {
  small,
  medium,
  large,
  xlarge,
}

abstract class _GameStateBase with Store {
  @observable
  bool isUpdating = false;

  @observable
  BoardSize boardSize = BoardSize.medium;

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
      case BoardSize.medium:
        return 8;
      case BoardSize.large:
        return 12;
      case BoardSize.xlarge:
        return 16;
    }
  }
}
