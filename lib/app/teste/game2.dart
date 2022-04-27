import 'dart:ui';

import 'package:flame/game.dart';
import 'package:game/app/teste/direction_teste.dart';
import 'package:game/app/teste/player_teste.dart';
import 'package:game/app/teste/world.dart';

class Game2 extends FlameGame {
  //rayworldGame
  final Player _player = Player();
  final World _world = World();

  //add adiciona qualquer componente ao core do jogo
  @override
  Future<void> onLoad() async {
    await add(_world);
    add(_player);

    _player.position = _world.size / 2;
    camera.followComponent(_player,
        worldBounds: Rect.fromLTRB(0, 0, _world.size.x, _world.size.y));
  }

  void onJoypadDirectionChanged(Direction direction) {
    _player.direction = direction;
  }
}
