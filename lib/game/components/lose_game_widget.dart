import 'package:flutter/material.dart';
import 'package:game/game/game_maker.dart';
import 'package:game/game/utils/pause_widget.dart';

class LoseGame extends StatelessWidget {
  static const String id = 'FinishGame';
  final GameMaker gameRef;
  const LoseGame({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    gameRef.pauseEngine();
    gameRef.overlays.remove(PauseWidget.id);
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Você perdeu!',
            style: TextStyle(
              fontFamily: 'Speedrush',
              fontSize: 50,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Tente novamente!',
            style: TextStyle(
              fontFamily: 'Speedrush',
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              gameRef.overlays.remove(LoseGame.id);
              Navigator.of(context).pop();
            },
            child: Container(
              width: 150,
              padding: const EdgeInsets.all(3.0),
              child: const Center(
                child: Text(
                  'Voltar ao menu',
                  style: TextStyle(
                    fontFamily: 'Speedrush',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent, width: 2),
                color: const Color(0xFF50abe7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
