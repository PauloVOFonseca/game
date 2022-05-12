import 'package:flutter/material.dart';
import 'package:game/game/data/db/hive_service.dart';
import 'package:game/game/shared/dialogs.dart';

class TrophiesScreen extends StatelessWidget {
  final Dialogs dialogs = Dialogs();
  final HiveService hiveService = HiveService();

  TrophiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> allInformationsKey = [];
    final gameKeys = hiveService.getGameKeys();
    print('teste: $gameKeys');

    for (final key in gameKeys) {
      final colletedInformations = hiveService.getGameSaved(key);
      allInformationsKey = [
        ...colletedInformations.levels.values.first.collectedInformations
      ];
    }

    return Scaffold(
      backgroundColor: const Color(0xFF50abe7),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Coletados',
                style: TextStyle(
                  fontFamily: 'IndieFlower',
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Aqui são exibidos os textos informativos que foram coletados durante o jogo. Jogue para desbloquear.',
                style: TextStyle(
                  fontFamily: 'IndieFlower',
                  fontSize: 20,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: dialogs.dialogs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final bool canShow;
                    if (allInformationsKey
                        .contains(dialogs.dialogs.keys.elementAt(index))) {
                      canShow = true;
                    } else {
                      canShow = false;
                    }
                    if (index > 4) {
                      return buildInfoWidget(
                          dialogs.dialogs.values.elementAt(index), canShow);
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
          Positioned(
            top: 30,
            left: 30,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                size: 40,
                color: Color(0xFF2E3035),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInfoWidget(dynamic info, bool canShow) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 2),
      child: Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Stack(
          children: [
            Text(
              info,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: canShow ? Colors.teal : Colors.teal.withOpacity(0.1),
                fontSize: 16,
              ),
            ),
            if (canShow == false)
              const Center(
                child: Icon(
                  Icons.lock,
                  color: Colors.teal,
                ),
              ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
          border: Border.all(color: const Color(0xFFFFD700), width: 4),
        ),
      ),
    );
  }
}
