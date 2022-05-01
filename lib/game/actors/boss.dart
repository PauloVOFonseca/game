import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:game/game/actors/bullet.dart';
import 'package:game/game/actors/platform.dart';
import 'package:game/game/components/win_game_widget.dart';
import 'package:game/game/game_maker.dart';

class Boss extends SpriteAnimationComponent
    with HasGameRef<GameMaker>, CollisionCallbacks {
  late Timer timer;
  Boss({
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
        ) {
    timer = Timer(5, onTick: handleMovement, repeat: true);
  }

  bool _isOnGround = false;

  final double _gravity = 10;
  final double _moveSpeed = 2;
  int _horizontalMovement = 0;
  int countMoves = 0;
  final Vector2 _velocity = Vector2.zero();
  final Vector2 _up = Vector2(0, -1);

  late final SpriteAnimation _runLeftAnimation;
  late final SpriteAnimation _runRightAnimation;
  late final SpriteAnimation _standingAnimation;
  final double _animationSpeed = 0.15;

  bool followPlayer = false;

  @override
  void onMount() {
    super.onMount();
    timer.start();
  }

  @override
  Future<void>? onLoad() {
    _loadAnimations().then((_) => {animation = _standingAnimation});
    add(CircleHitbox());

    return super.onLoad();
  }

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load('Boss.png'),
      srcSize: Vector2(32.0, 32.0),
    );

    _runLeftAnimation = spriteSheet.createAnimation(
        row: 0, stepTime: _animationSpeed, from: 4, to: 8);
    _runRightAnimation = spriteSheet.createAnimation(
        row: 0, stepTime: _animationSpeed, from: 0, to: 4);
    _standingAnimation = spriteSheet.createAnimation(
        row: 0, stepTime: _animationSpeed, from: 0, to: 3);
  }

  @override
  void update(double dt) {
    super.update(dt);
    timer.update(dt);

    _velocity.y += _gravity;

    if (!_isOnGround) {
      position += _velocity * dt;
    }

    if (followPlayer) {
      if (countMoves == 90) {
        _horizontalMovement = -1;
        countMoves--;
        animation = _runLeftAnimation;
      } else if (countMoves == 0) {
        _horizontalMovement = 1;
        countMoves++;
        animation = _runRightAnimation;
      } else {
        countMoves += _horizontalMovement == 1 ? 1 : -1;
        position += Vector2(_horizontalMovement.toDouble(), 0) * _moveSpeed;
      }
    }
    else{

    }
  }

 void handleMovement(){
   followPlayer = !followPlayer;
   shotBullet();
  }

  void shotBullet() {
    
    Bullet bullet = Bullet(position: position, size: Vector2(32, 32));
    bullet.anchor = Anchor.center;
    gameRef.add(bullet);
  }

  void reduceLife() {
    removeFromParent();
    gameRef.overlays.add(Wingame.id);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Platform) {
      if (intersectionPoints.length == 2) {
        final mid = (intersectionPoints.elementAt(0) +
                intersectionPoints.elementAt(1)) /
            2;

        final collisionNormal = absoluteCenter - mid;
        final separationDistance = (size.x / 2) - collisionNormal.length;
        collisionNormal.normalize();

        if (_up.dot(collisionNormal) > 0.9) {
          _isOnGround = true;
        }

        position += collisionNormal.scaled(separationDistance);
      }
    }

    super.onCollision(intersectionPoints, other);
  }
}
