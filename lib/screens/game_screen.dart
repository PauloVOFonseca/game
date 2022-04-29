import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/game/game_maker.dart';

class GameScreen extends StatefulWidget {
  //maingamestate
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  GameMaker game = GameMaker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(game: game),
    );
  }
}
