import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:game/app/teste/direction_teste.dart';

class Player extends SpriteAnimationComponent with HasGameRef {
  Player()
      : super(
          size: Vector2.all(50),
        );

  Direction direction = Direction.none; //.none;
  final double _playerSpeed = 300.0;
  final double _animationSpeed = 0.15;
  //late final SpriteAnimation _runDownAnimation;
  late final SpriteAnimation _runLeftAnimation;
  late final SpriteAnimation _runUpAnimation;
  late final SpriteAnimation _runRightAnimation;
  late final SpriteAnimation _standingAnimation;

  //carrega o sprite do jogador e posiciona no meio do jogo
  @override
  Future<void> onLoad() async {
    super.onLoad();
    _loadAnimations().then((_) => {animation = _standingAnimation});

    //sprite = await gameRef.loadSprite('player.png');
    //position = gameRef.size / 2;
  }

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load('player_spritesheet2.png'),
      srcSize: Vector2(29.0, 32.0),
    );

    position = gameRef.size / 2;

    _runLeftAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 4);

    _runRightAnimation =
        spriteSheet.createAnimation(row: 1, stepTime: _animationSpeed, to: 4);

    _standingAnimation =
        spriteSheet.createAnimation(row: 1, stepTime: _animationSpeed, to: 1);

    //ele tem que pular
    _runUpAnimation =
        spriteSheet.createAnimation(row: 1, stepTime: _animationSpeed, to: 4);

    //ele não abaixa
    //_runDownAnimation =
    //    spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 4);
  }

  //vai ser chamada sempre que o frame for renderizado
  @override
  void update(double dt) {
    super.update(dt);
    movePlayer(dt);
  }

  //move o jogador
  void movePlayer(double dt) {
    switch (direction) {
      case Direction.up:
        animation = _runUpAnimation;
        moveUp(dt);
        break;
      case Direction.down:
        animation = _standingAnimation;
        // animation = _runDownAnimation;
        // moveDown(dt);
        break;
      case Direction.left:
        animation = _runLeftAnimation;
        moveLeft(dt);
        break;
      case Direction.right:
        animation = _runRightAnimation;
        moveRight(dt);
        break;
      case Direction.none:
        animation = _standingAnimation;
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
