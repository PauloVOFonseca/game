import 'package:flame/game.dart';
import 'package:game/app/teste/direction_teste.dart';
import 'package:game/app/teste/player_teste.dart';

class Game2 extends FlameGame {
  //rayworldGame
  final Player _player = Player();

  //add adiciona qualquer componente ao core do jogo
  @override
  Future<void> onLoad() async {
    add(_player);
  }

  void onJoypadDirectionChanged(Direction direction){
    _player.direction = direction;
  }
}
