import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'controller/game_controller.dart';
import 'state/game_state.dart';

class GamePage extends StatefulWidget {
  const GamePage({
    Key? key,
  }) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    super.initState();
    GameController.initialize();
  }

  @override
  void dispose() {
    GameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: GameController.onPopScope,
      child: Scaffold(
        body: Observer(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              key: gamePageKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Time: ${gameState.elapsedTimeStr}"),
                    const SizedBox(height: 32),
                    GameController.makeTable(context, gameState.numColumns),
                    const SizedBox(height: 32),
                    SizedBox(
                      height: 64,
                      child: ElevatedButton(
                        onPressed: GameController.onBtnBackClick,
                        child: const Icon(Icons.arrow_back),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amberAccent.shade700,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

final gamePageKey = GlobalKey();
