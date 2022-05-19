import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:game/game/actors/platform.dart';
import 'package:game/game/actors/player.dart';
import 'package:game/game/components/lose_game_widget.dart';

class Bullet extends SpriteComponent with CollisionCallbacks, HasGameRef {
  Bullet({
    Vector2? position,
    Vector2? size,
  }) : super(
          size: size,
          position: position,
        );

  final double _speed = 250;

  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite('bullet.png');
    add(RectangleHitbox()..collisionType = CollisionType.passive);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);

    position += Vector2(0, -1) * _speed * dt;

    if (position.y < 0) {
      removeFromParent();
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player) {
      gameRef.overlays.add(LoseGame.id);
    }
    if (other is Platform) {
      removeFromParent();
    }

    super.onCollision(intersectionPoints, other);
  }
}
