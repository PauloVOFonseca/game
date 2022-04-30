import 'package:flutter/material.dart';
import 'package:game/game/game_maker.dart';
import 'package:game/game/utils/pause_widget.dart';

class InfoWidget extends StatelessWidget {
  static const String id = 'Info';
  final GameMaker gameRef;
  const InfoWidget({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    gameRef.pauseEngine();
    return Center(
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent, width: 2),
          color: const Color(0xFF50abe7),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  gameRef.resumeEngine();
                  gameRef.overlays.add(PauseWidget.id);
                  gameRef.overlays.remove(InfoWidget.id);
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
            Center(child: Text(gameRef.infoText)),
          ],
        ),
      ),
    );
  }
}
