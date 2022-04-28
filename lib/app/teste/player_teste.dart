import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

class Player extends SpriteAnimationComponent with HasGameRef {
  Player(this.joystick)
      : super(
          size: Vector2.all(50),
        );

  final double _playerSpeed = 200.0;
  final double _animationSpeed = 0.15;
  //late final SpriteAnimation _runDownAnimation;
  late final SpriteAnimation _runLeftAnimation;
  late final SpriteAnimation _runUpAnimation;
  late final SpriteAnimation _runRightAnimation;
  late final SpriteAnimation _standingAnimation;
  final JoystickComponent joystick;

  //carrega o sprite do jogador e posiciona no meio do jogo
  @override
  Future<void> onLoad() async {
    super.onLoad();

    _loadAnimations().then((_) => {animation = _standingAnimation});
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

    _standingAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 1);

    //ele tem que pular
    _runUpAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 4);

    //ele não abaixa
    //_runDownAnimation =
    //    spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 4);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (!joystick.delta.isZero()) {
      position.add(joystick.relativeDelta * _playerSpeed * dt);
      movePlayer(dt, joystick.direction);
    }
  }

  //move o jogador
  void movePlayer(double dt, JoystickDirection direction) {
    switch (direction) {
      case JoystickDirection.up:
        animation = _runUpAnimation;
        moveUp(dt);
        break;
      case JoystickDirection.down:
        animation = _standingAnimation;
        break;
      case JoystickDirection.left:
        animation = _runLeftAnimation;
        moveLeft(dt);
        break;
      case JoystickDirection.right:
        animation = _runRightAnimation;
        moveRight(dt);
        break;
      case JoystickDirection.idle:
        animation = _standingAnimation;
        break;
      default:
        break;
    }
  }

  void moveUp(double delta) {
    position.add(Vector2(0, delta * -_playerSpeed));
  }

  void moveDown(double delta) {
    position.add(Vector2(0, delta * _playerSpeed));
  }

  void moveLeft(double delta) {
    position.add(Vector2(delta * -_playerSpeed, 0));
  }

  void moveRight(double delta) {
    position.add(Vector2(delta * _playerSpeed, 0));
  }
}
