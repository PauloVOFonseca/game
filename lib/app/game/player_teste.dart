import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:game/app/game/platform.dart';

class Player extends SpriteAnimationComponent
    with HasGameRef, CollisionCallbacks {
  Player(this.joystick)
      : super(
          size: Vector2.all(50),
        );

  int _hAxisInput = 0;
  bool _jumpInput = false;
  bool _isOnGround = false;

  final double _gravity = 10;
  final double _jumpSpeed = 320;
  final double _moveSpeed = 200;
  final double _animationSpeed = 0.15;

  late final SpriteAnimation _runLeftAnimation;
  late final SpriteAnimation _runUpAnimation;
  late final SpriteAnimation _runRightAnimation;
  late final SpriteAnimation _standingAnimation;
  final JoystickComponent joystick;

  final Vector2 _up = Vector2(0, -1);
  final Vector2 _velocity = Vector2.zero();

  @override
  Future<void> onLoad() async {
    super.onLoad();

    _loadAnimations().then((_) => {animation = _standingAnimation});
    add(CircleHitbox());
    return super.onLoad();
  }

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load('player_spritesheet.png'),
      srcSize: Vector2(27.0, 32.0),
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

  @override
  void update(double dt) {
    _hAxisInput = 0;

    if (!joystick.delta.isZero()) {
      movePlayer(joystick.direction);
    }

    _velocity.x = _hAxisInput * _moveSpeed;
    _velocity.y += _gravity;

    if (_jumpInput) {
      if (_isOnGround) {
        _velocity.y = -_jumpSpeed;
        _isOnGround = false;
      }
      _jumpInput = false;
    }

    _velocity.y = _velocity.y.clamp(-_jumpSpeed, 150);
    position += _velocity * dt;

    super.update(dt);
  }

  void movePlayer(JoystickDirection direction) {
    switch (direction) {
      case JoystickDirection.up:
        animation = _runUpAnimation;
        _jumpInput = true;
        break;
      case JoystickDirection.down:
        animation = _standingAnimation;
        break;
      case JoystickDirection.left:
        animation = _runLeftAnimation;
        _hAxisInput = -1;
        break;
      case JoystickDirection.right:
        animation = _runRightAnimation;
        _hAxisInput = 1;
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
    super.onCollision(intersectionPoints, other);
  }
}