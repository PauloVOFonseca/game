import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:game/game/actors/enemy.dart';
import 'package:game/game/actors/platform.dart';
import 'package:game/game/components/lose_game_widget.dart';

class Player extends SpriteAnimationComponent
    with HasGameRef, CollisionCallbacks {
  Player(
    this.joystick,
    Vector2? position,
    Vector2? size,
  ) : super(
          size: size,
          position: position,
        );

  final JoystickComponent joystick;

  int _horizontalMovement = 0;
  bool _jump = false;
  bool _isOnGround = false;

  final double _gravity = 10;
  final double _jumpSpeed = 280;
  final double _moveSpeed = 200;
  final double _animationSpeed = 0.15;
  final Vector2 _up = Vector2(0, -1);
  final Vector2 _velocity = Vector2.zero();

  late final SpriteAnimation _runLeftAnimation;
  late final SpriteAnimation _runUpAnimation;
  late final SpriteAnimation _runRightAnimation;
  late final SpriteAnimation _standingAnimation;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    _loadAnimations().then((_) => {animation = _standingAnimation});
    add(CircleHitbox());
    return super.onLoad();
  }

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load('Player.png'),
      srcSize: Vector2(32.0, 32.0),
    );

    createAnimation(spriteSheet);
  }

  createAnimation(SpriteSheet spriteSheet) {
    _runLeftAnimation = spriteSheet.createAnimation(
        row: 0, stepTime: _animationSpeed, from: 4, to: 8);
    _runRightAnimation = spriteSheet.createAnimation(
        row: 0, stepTime: _animationSpeed, from: 0, to: 4);
    _standingAnimation = spriteSheet.createAnimation(
        row: 0, stepTime: _animationSpeed, from: 0, to: 3);
    _runUpAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 1);
  }

  @override
  void update(double dt) {
    _horizontalMovement = 0;

    if (!joystick.delta.isZero()) {
      movePlayer(joystick.direction);
    }

    _velocity.x = _horizontalMovement * _moveSpeed;
    _velocity.y += _gravity;

    if (_jump) {
      if (_isOnGround) {
        _velocity.y = -_jumpSpeed;
        _isOnGround = false;
      }
      _jump = false;
    }

    _velocity.y = _velocity.y.clamp(-_jumpSpeed, 150);
    position += _velocity * dt;

    super.update(dt);
  }

  void movePlayer(JoystickDirection direction) {
    switch (direction) {
      case JoystickDirection.up:
        animation = _runUpAnimation;
        _jump = true;
        break;
      case JoystickDirection.down:
        animation = _standingAnimation;
        break;
      case JoystickDirection.left:
        animation = _runLeftAnimation;
        _horizontalMovement = -1;
        break;
      case JoystickDirection.right:
        animation = _runRightAnimation;
        _horizontalMovement = 1;
        break;
      case JoystickDirection.idle:
        animation = _standingAnimation;
        break;
      default:
        break;
    }
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

    if (other is Enemy) {
      if (position.y < other.y) {
        other.removeFromParent();
      }else{
        gameRef.overlays.add(LoseGame.id);
      }
    }
    super.onCollision(intersectionPoints, other);
  }
}
