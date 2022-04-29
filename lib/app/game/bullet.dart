import 'package:flame/components.dart';

class Bullet extends SpriteComponent {
  Bullet({
    Sprite? sprite,
    Vector2? position,
    Vector2? size,
  }
  ) : super(
          sprite: sprite,
          size: size,
          position: position,
        );

  final double _speed = 450;

  @override
  void update(double dt) {
    super.update(dt);

    position += Vector2(0, -1) * _speed * dt;

    // if (this.position.y < 0 ){
    //   remove();
    // }
  }
}
