import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:game/app/teste/game2.dart';
import 'package:game/app/teste/player_teste.dart';
import 'package:game/app/teste/world.dart';

class Level extends Component with HasGameRef<Game2> {
  late final Player _player;
  final JoystickComponent joystick;
  final String levelName;
  final World _world = World();

  Level(this.levelName, this.joystick) : super();

  @override
  Future<void>? onLoad() async {
    await add(_world);
    _player = Player(joystick);

    _spawnActors();
    _setupCamera();

    return super.onLoad();
  }

  void _spawnActors() {
    add(_player);
    gameRef.add(joystick);
  }

  void _setupCamera() {
    gameRef.camera.followComponent(_player,
        worldBounds: Rect.fromLTRB(0, 0, _world.size.x, _world.size.y));
  }
}
