import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/app/teste/level.dart';

class Game2 extends FlameGame with HasDraggables {
  //rayworldGame
  Level? _currentLevel;
  late final JoystickComponent joystick;

  //add adiciona qualquer componente ao core do jogo
  @override
  Future<void> onLoad() async {
    joystick = createJoystick();

    loadLevel('Level1.tmx');
    return super.onLoad();
  }

  void loadLevel(String levelName) {
    _currentLevel?.removeFromParent();
    _currentLevel = Level(levelName, joystick);
    add(_currentLevel!);
  }

  createJoystick() {
    final knobPaint = Paint()..color = Colors.white;
    final backgroundPaint = Paint()..color = Colors.grey;
    return JoystickComponent(
      knob: CircleComponent(radius: 30, paint: knobPaint),
      background: CircleComponent(radius: 60, paint: backgroundPaint),
      margin: const EdgeInsets.only(left: 20, bottom: 20),
    );
  }
}
