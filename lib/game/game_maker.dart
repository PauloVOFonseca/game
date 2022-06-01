import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/painting.dart';
import 'package:game/screens/levels/level_maker.dart';

class GameMaker extends FlameGame with HasCollisionDetection, HasDraggables {
  late String levelArqName;

  LevelMaker? _currentLevel;
  late String infoText;
  List<String> dialogsColleted = [];

  late final JoystickComponent joystick;
  int playerScore = 0;

  @override
  Future<void>? onLoad() async {
    await Flame.device.fullScreen();
    await Flame.device.setLandscape();

    joystick = createJoystick();

    camera.viewport = FixedResolutionViewport(
      Vector2(640, 330),
    );

    loadLevel('$levelArqName.tmx');

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

  void newInfoTextDetect(String infoText) {
    this.infoText = infoText;
    dialogsColleted.add(infoText);
  }
}
