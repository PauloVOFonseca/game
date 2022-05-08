import 'package:game/game/data/models/game_model.dart';
import 'package:hive/hive.dart';

class HiveService {
  bool isBoxOpen(String box) {
    final open = Hive.isBoxOpen(box);
    return open;
  }

  handleSaveLevel() {
    print('AQUI');
  }

// HiveService hiveService = HiveService();

////Isso salva
// LevelModel levelModel = LevelModel(
//     playerScore: 2, collectedInformations: ['teste']);
// GameModel gameModel =
//     GameModel(levels: {'teste2': levelModel});
// await hiveService.saveLevel('teste2', gameModel);

//Isso pega
//final teste = hiveService.getGameSaved('teste');
//print('${teste.levels['teste2']?.playerScore}');

  Future saveLevel(String keyName, GameModel gameSave) =>
      Hive.box("levels").put(keyName, gameSave);

  GameModel getGameSaved(String keyName) =>
      Hive.box("levels").get(keyName) as GameModel;

  //getGameSaved2() => Hive.box("levels").keys;

  Future clearDatabase() async => await Hive.deleteFromDisk();
}
