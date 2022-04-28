import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/app/teste/game2.dart';

class Teste2 extends StatefulWidget {
  //maingamestate
  const Teste2({Key? key}) : super(key: key);

  @override
  State<Teste2> createState() => _Teste2State();
}

class _Teste2State extends State<Teste2> {
  Game2 game = Game2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(game: game),
    );
  }
}
