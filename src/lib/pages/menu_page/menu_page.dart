import 'package:flutter/material.dart';

import '../game_page/state/game_state.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        key: menuPageKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              const Text(
                'Programmers',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Riddle',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => {gameState.boardSize = BoardSize.small, Navigator.pushNamed(menuPageKey.currentContext!, '/game')},
                    child: const Text("4x4"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amberAccent.shade700,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(32),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => {gameState.boardSize = BoardSize.medium, Navigator.pushNamed(menuPageKey.currentContext!, '/game')},
                    child: const Text("8x8"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amberAccent.shade700,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(32),
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () => MenuController.onEnterGame(BoardSize.large),
                  //   child: const Text("12x12"),
                  //   style: ElevatedButton.styleFrom(
                  //     primary: Colors.amberAccent.shade700,
                  //     shape: const CircleBorder(),
                  //     padding: const EdgeInsets.all(32),
                  //   ),
                  // ),
                  // ElevatedButton(
                  //   onPressed: () => MenuController.onEnterGame(BoardSize.xlarge),
                  //   child: const Text("16x16"),
                  //   style: ElevatedButton.styleFrom(
                  //     primary: Colors.amberAccent.shade700,
                  //     shape: const CircleBorder(),
                  //     padding: const EdgeInsets.all(32),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 36),
              SizedBox(
                height: 35,
                width: 250,
                child: ElevatedButton(
                  child: const Text("I'm not a programmer"),
                  onPressed: () => Navigator.pushNamed(menuPageKey.currentContext!, '/help'),
                ),
              ),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}

final menuPageKey = GlobalKey();
