import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/game/components/lose_game_widget.dart';
import 'package:game/game/game_maker.dart';
import 'package:game/game/components/pause_menu.dart';
import 'package:game/game/utils/pause_widget.dart';

class GameScreen extends StatefulWidget {
  //maingamestate
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  GameMaker game = GameMaker();

  @override
  void dispose() {
    game.removeFromParent();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: game,
        initialActiveOverlays: const [PauseWidget.id],
        overlayBuilderMap: {
          PauseWidget.id: (BuildContext context, GameMaker gameRef) => PauseWidget(gameRef: gameRef),
          PauseMenu.id: (BuildContext context, GameMaker gameRef) => PauseMenu(gameRef: gameRef),
          LoseGame.id: (BuildContext context, GameMaker gameRef) => LoseGame(gameRef: gameRef),
        },
      ),
    );
  }
}
