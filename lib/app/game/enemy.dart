import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

// Represents an enemy in the game world.
class Enemy extends SpriteAnimationComponent with HasGameRef {
  Enemy(
    {
    Vector2? position,
    Vector2? size,
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
          priority: priority,
        );

  late final SpriteAnimation _runLeftAnimation;
  late final SpriteAnimation _runUpAnimation;
  late final SpriteAnimation _runRightAnimation;
  late final SpriteAnimation _standingAnimation;
  final double _animationSpeed = 0.15;

  @override
  Future<void>? onLoad() {
    _loadAnimations().then((_) => {animation = _standingAnimation});
    add(CircleHitbox());

    return super.onLoad();
  }

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load('Enemy1.png'),
      srcSize: Vector2(32.0, 32.0),
    );

    position = gameRef.size / 2;

    _runLeftAnimation = spriteSheet.createAnimation(
        row: 0, stepTime: _animationSpeed, from: 4, to: 7);
    _runRightAnimation = spriteSheet.createAnimation(
        row: 0, stepTime: _animationSpeed, from: 0, to: 3);
    _standingAnimation = spriteSheet.createAnimation(
        row: 0, stepTime: _animationSpeed, from: 0, to: 3);
    _runUpAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 1);
  }
}
