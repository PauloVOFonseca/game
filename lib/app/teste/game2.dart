import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/app/teste/player_teste.dart';
import 'package:game/app/teste/world.dart';

class Game2 extends FlameGame with HasDraggables {
  //rayworldGame
  late final Player _player;
  final World _world = World();
  late final JoystickComponent joystick;

  //add adiciona qualquer componente ao core do jogo
  @override
  Future<void> onLoad() async {
    await add(_world);
    joystick = createJoystick();
    _player = Player(joystick);

    add(_player);
    add(joystick);
    camera.followComponent(_player,
        worldBounds: Rect.fromLTRB(0, 0, _world.size.x, _world.size.y));
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
