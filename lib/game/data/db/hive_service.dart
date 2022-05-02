import 'package:game/game/data/models/game_model.dart';
import 'package:hive/hive.dart';

class HiveService {
  bool isBoxOpen(String box) {
    final open = Hive.isBoxOpen(box);
    return open;
  }

  Future saveLevel(GameModel gameSave) => Hive.box("levels").put("save", gameSave);

  GameModel get getGameSaved => Hive.box("levels").get("save") as GameModel;

  Future clearDatabase() async => await Hive.deleteFromDisk();
}

