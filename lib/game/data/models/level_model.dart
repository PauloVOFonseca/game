import 'package:hive/hive.dart';

part 'level_model.g.dart';

@HiveType(typeId: 2)
class LevelModel extends HiveObject{
  LevelModel({required this.playerScore, required this.collectedInformations});

  @HiveField(0)
  int playerScore;

  @HiveField(1)
  List<String> collectedInformations;
}
