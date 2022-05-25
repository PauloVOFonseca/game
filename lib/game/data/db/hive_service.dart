import 'package:game/game/data/models/game_model.dart';
import 'package:game/game/data/models/level_model.dart';
import 'package:hive/hive.dart';

class HiveService {
  bool isBoxOpen(String box) {
    final open = Hive.isBoxOpen(box);
    return open;
  }

  handleSaveLevel(String levelName, List<String> colleted) async {
    final oldGame = getGameSaved(levelName);
    if (oldGame == null ||
        oldGame.levels.values.first.collectedInformations.length <
            colleted.length) {
      LevelModel levelModel = LevelModel(
          playerScore: colleted.length, collectedInformations: colleted);
      GameModel gameModel = GameModel(levels: {levelName: levelModel});
      await saveLevel(levelName, gameModel);
    }
  }

  Future saveLevel(String keyName, GameModel gameSave) =>
      Hive.box("levels").put(keyName, gameSave);

  getGameSaved(String keyName) =>
      Hive.box("levels").get(keyName, defaultValue: null);

  getGameKeys() => Hive.box("levels").keys;

  Future clearDatabase() async => await Hive.deleteFromDisk();
}
