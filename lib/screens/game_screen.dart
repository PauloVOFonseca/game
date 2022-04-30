import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/game/components/info_widget.dart';
import 'package:game/game/components/lose_game_widget.dart';
import 'package:game/game/components/player_status.dart';
import 'package:game/game/components/win_game_widget.dart';
import 'package:game/game/game_maker.dart';
import 'package:game/game/components/pause_menu.dart';
import 'package:game/game/utils/pause_widget.dart';

class GameScreen extends StatefulWidget {
  final String levelArqName;
  const GameScreen({Key? key, required this.levelArqName}) : super(key: key);

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
    game.levelArqName = widget.levelArqName;
    return Scaffold(
      body: GameWidget(
        game: game,
        initialActiveOverlays: const [PauseWidget.id, PlayerStatusWidget.id],
        overlayBuilderMap: {
          PauseWidget.id: (BuildContext context, GameMaker gameRef) =>
              PauseWidget(gameRef: gameRef),
          PauseMenu.id: (BuildContext context, GameMaker gameRef) =>
              PauseMenu(gameRef: gameRef),
          LoseGame.id: (BuildContext context, GameMaker gameRef) =>
              LoseGame(gameRef: gameRef),
          Wingame.id: (BuildContext context, GameMaker gameRef) =>
              Wingame(gameRef: gameRef),
          InfoWidget.id: (BuildContext context, GameMaker gameRef) =>
              InfoWidget(gameRef: gameRef),
          PlayerStatusWidget.id: (BuildContext context, GameMaker gameRef) =>
              PlayerStatusWidget(gameRef: gameRef),
        },
      ),
    );
  }
}
