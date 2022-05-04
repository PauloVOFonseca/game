import 'package:game/game/data/models/game_model.dart';
import 'package:hive/hive.dart';

class HiveService {
  bool isBoxOpen(String box) {
    final open = Hive.isBoxOpen(box);
    return open;
  }

  Future saveLevel(String keyName, GameModel gameSave) => Hive.box("levels").put(keyName, gameSave);

  GameModel getGameSaved(String keyName) => Hive.box("levels").get(keyName) as GameModel;

  Future clearDatabase() async => await Hive.deleteFromDisk();
}

