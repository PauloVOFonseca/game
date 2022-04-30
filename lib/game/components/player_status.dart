import 'package:flutter/material.dart';
import 'package:game/game/game_maker.dart';

class PlayerStatusWidget extends StatelessWidget {
  static const String id = 'PlayerStatus';
  final GameMaker gameRef;
  const PlayerStatusWidget({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 20,
          right: 40,
          child: Text(
            "Pontuação: ${gameRef.playerScore}",
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        Positioned(
          top: 35,
          right: 40,
          child: Text(
            "Energia: ${gameRef.playerEnergy}",
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ],
    );
  }
}
