import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';

class SimplePlatformer extends FlameGame {
  @override
  Future<void>? onLoad() async {
    await Flame.device.fullScreen();
    //await Flame.device.setLandscape();

    // camera.viewport = FixedResolutionViewport(
    //   Vector2(640, 320),
    // );

    final level = await TiledComponent.load(
      'level1.tmx',
      Vector2.all(32),
    );
    add(level);

    return super.onLoad();
  }
}
