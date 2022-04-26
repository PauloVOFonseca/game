import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/image_composition.dart';
import 'package:game/app/game/level.dart';

class SimplePlatformer extends FlameGame {
  Level? _currentLevel;

  late Image spriteSheet;

  @override
  Future<void>? onLoad() async {
    await Flame.device.fullScreen();
    //await Flame.device.setLandscape();

    // camera.viewport = FixedResolutionViewport(
    //   Vector2(640, 320),
    // );

    loadLevel('level1.tmx');

    return super.onLoad();
  }

  // Swaps current level with given level
  void loadLevel(String levelName) {
    _currentLevel?.removeFromParent();
    _currentLevel = Level(levelName);
    add(_currentLevel!);
  }
}
