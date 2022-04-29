import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:game/app/game/enemy.dart';
import 'package:game/app/game/game2.dart';
import 'package:game/app/game/platform.dart';
import 'package:game/app/game/player_teste.dart';
import 'package:tiled/tiled.dart';

class Level extends Component with HasGameRef<Game2> {
  final String levelName;
  late Player _player;
  late Rect _levelBounds;
  final JoystickComponent joystick;

  Level(this.levelName, this.joystick) : super();

  @override
  Future<void>? onLoad() async {
    final level = await TiledComponent.load(
      levelName,
      Vector2.all(32),
    );
    add(level);

    _levelBounds = Rect.fromLTWH(
      0,
      0,
      (level.tileMap.map.width * level.tileMap.map.tileWidth).toDouble(),
      (level.tileMap.map.height * level.tileMap.map.tileHeight).toDouble(),
    );

    _spawnActors(level.tileMap);
    _setupCamera();

    return super.onLoad();
  }

  void _spawnActors(RenderableTiledMap tileMap) {
    final platformsLayer = tileMap.getLayer<ObjectGroup>('Platforms');

    for (final platformObject in platformsLayer!.objects) {
      final platform = Platform(
        position: Vector2(platformObject.x, platformObject.y),
        size: Vector2(platformObject.width, platformObject.height),
      );
      add(platform);
    }

    final spawnPointsLayer = tileMap.getLayer<ObjectGroup>('SpawnPoints');

    for (final spawnPoint in spawnPointsLayer!.objects) {
      final position = Vector2(spawnPoint.x, spawnPoint.y - spawnPoint.height);
      final size = Vector2(spawnPoint.width, spawnPoint.height);

      switch (spawnPoint.type) {
        case 'Player':
          _player = Player(joystick, position, size);
          add(_player);
          gameRef.add(joystick);
          break;
        case 'Enemy':
          final _enemy = Enemy(position: position, size: size * 2);
          add(_enemy);
          break;
      }
    }
  }

  void _setupCamera() {
    gameRef.camera.followComponent(_player);
    gameRef.camera.worldBounds = _levelBounds;
  }
}
