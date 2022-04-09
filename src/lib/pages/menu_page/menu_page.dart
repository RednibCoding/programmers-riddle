import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../game_page/state/game_state.dart';
import 'controller/menu_controller.dart';
import 'state/menu_state.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    MenuController.initialize();
    super.initState();
  }

  @override
  void dispose() {
    MenuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: MenuController.onPopScope,
      child: Scaffold(
        body: Observer(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              key: menuPageKey,
              child: menuState.isUpdating
                  ? const CircularProgressIndicator()
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 24),
                          const Text(
                            'Programmers Riddle',
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
                                onPressed: () => MenuController.onEnterGame(BoardSize.small),
                                child: const Text("4x4"),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.amberAccent.shade700,
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(32),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () => MenuController.onEnterGame(BoardSize.medium),
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
                              onPressed: () => MenuController.onHelpClick(),
                            ),
                          ),
                          const SizedBox(height: 24.0),
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

final menuPageKey = GlobalKey();
