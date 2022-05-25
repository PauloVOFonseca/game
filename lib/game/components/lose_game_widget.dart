import 'package:flutter/material.dart';
import 'package:game/game/data/db/hive_service.dart';
import 'package:game/game/game_maker.dart';

class LoseGame extends StatelessWidget {
  static const String id = 'LoseGame';
  final GameMaker gameRef;
  final HiveService hiveService = HiveService();
  LoseGame({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    gameRef.pauseEngine();
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
            onTap: () async {
              gameRef.overlays.remove(LoseGame.id);
              Navigator.of(context).pop();
              await hiveService.handleSaveLevel(
                  gameRef.levelArqName, gameRef.dialogsColleted);
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
