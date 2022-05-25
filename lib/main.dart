import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game/game/data/db/hive_config.dart';
import 'package:game/game/data/models/game_model.dart';
import 'package:game/game/data/models/level_model.dart';
import 'package:game/screens/home.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

   Future.delayed(Duration.zero, () async {
      await HiveConfig.initHive();
    });

    Hive.registerAdapter(GameModelAdapter());
    Hive.registerAdapter(LevelModelAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
