import 'package:flutter/material.dart';
import 'package:game/game/game_maker.dart';
import 'package:game/game/components/pause_menu.dart';

class PauseWidget extends StatelessWidget {
  static const String id = 'PauseButton';
  final GameMaker gameRef;

  const PauseWidget({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTap: () {
          gameRef.pauseEngine();
          gameRef.overlays.add(PauseMenu.id);
          gameRef.overlays.remove(PauseWidget.id);
        },
        child: const Icon(
          Icons.pause_circle_outline_outlined,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
