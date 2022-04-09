import 'package:flutter/material.dart';

import '../../game_page/state/game_state.dart';
import '../menu_page.dart';

class MenuController {
  static void initialize() {}

  static void dispose() {}

  static Future<bool> onPopScope() async {
    return true;
  }

  static void onEnterGame(BoardSize size) {
    gameState.boardSize = size;
    Navigator.pushNamed(menuPageKey.currentContext!, '/game');
  }

  static void onHelpClick() {
    Navigator.pushNamed(menuPageKey.currentContext!, '/help');
  }
}
