import 'dart:io';

import 'package:game/game/data/db/hive_service.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveConfig {
  final HiveService hiveService;

  HiveConfig(this.hiveService);

  static initHive() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    await Hive.openBox("levels");
  }

  closeBox() async {
    await Hive.close();
  }

  Future clearDatabase() async => await hiveService.clearDatabase();
}
