import 'package:game/game/data/models/level_model.dart';
import 'package:hive/hive.dart';

part 'game_model.g.dart';

@HiveType(typeId: 1)
class GameModel extends HiveObject{
  GameModel({required this.levels});

  @HiveField(0)
  Map<String, LevelModel> levels;
}

