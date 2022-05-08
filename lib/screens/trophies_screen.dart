import 'package:flutter/material.dart';
import 'package:game/game/data/db/hive_service.dart';
import 'package:game/game/shared/dialogs.dart';

class TrophiesScreen extends StatelessWidget {
  final Dialogs dialogs = Dialogs();
  final HiveService hiveService = HiveService();
  TrophiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF50abe7),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
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
                  'Aqui são exibidos os textos informativos que foram coletados durante o jogo.',
                  style: TextStyle(
                    fontFamily: 'IndieFlower',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: dialogs.dialogs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildInfoWidget(
                        dialogs.dialogs.values.elementAt(index));
                  },
                ),
              ],
            ),
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

  Widget buildInfoWidget(dynamic info) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 2),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          info,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.teal,
            fontSize: 16,
          ),
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
