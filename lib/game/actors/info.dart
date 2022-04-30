import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Info extends PositionComponent with CollisionCallbacks {
  Info(
    this.infoText, {
    required Vector2 position,
    required Vector2 size,
    Vector2? scale,
    double? angle,
    Anchor? anchor,
    int? priority,
  }) : super(
          position: position,
          size: size,
          scale: scale,
          angle: angle,
          anchor: anchor,
        );

  final String infoText;

  @override
  Future<void>? onLoad() {
    add(RectangleHitbox()..collisionType = CollisionType.passive);
    return super.onLoad();
  }
}
