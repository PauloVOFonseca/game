import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/painting.dart';
import 'package:game/screens/levels/level_maker.dart';

class GameMaker extends FlameGame with HasCollisionDetection, HasDraggables {
  LevelMaker? _currentLevel;

  late Image spriteSheet;
  late final JoystickComponent joystick;

  @override
  Future<void>? onLoad() async {
    await Flame.device.fullScreen();
    await Flame.device.setLandscape();

    joystick = createJoystick();

    spriteSheet = await images.load('Spritesheet.png');

    camera.viewport = FixedResolutionViewport(
      Vector2(640, 330),
    );

    loadLevel('HowToPlay.tmx');

    return super.onLoad();
  }

  void loadLevel(String levelName) {
    _currentLevel?.removeFromParent();
    _currentLevel = LevelMaker(levelName, joystick);
    add(_currentLevel!);
  }

  createJoystick() {
    final knobPaint = Paint()..color = material.Colors.white.withOpacity(0.5);
    final backgroundPaint = Paint()
      ..color = material.Colors.grey.withOpacity(0.5);
    return JoystickComponent(
      knob: CircleComponent(radius: 25, paint: knobPaint),
      background: CircleComponent(radius: 50, paint: backgroundPaint),
      margin: const EdgeInsets.only(left: 10, bottom: 10),
    );
  }
}
