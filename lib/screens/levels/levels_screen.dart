import 'package:flutter/material.dart';
import 'package:game/screens/game_screen.dart';

class LevelsScreen extends StatelessWidget {
  final List levels = [1, 2, 3, 4];
  LevelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF50abe7),
      body: Stack(
        children: [
          Column(
            children: [
              const Center(
                child: Text(
                  'ObeGo',
                  style: TextStyle(
                    fontFamily: 'Speedrush',
                    color: Colors.black,
                    fontSize: 80,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: levels.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildLevelWidget(context, index + 1);
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

  Widget buildLevelWidget(BuildContext context, dynamic number) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GameScreen(
                levelArqName: 'Level$number',
              ),
            ),
          );
        },
        child: Container(
          height: 120,
          width: 120,
          child: Center(
            child: Text(
              number.toString(),
              style: const TextStyle(
                  color: Colors.teal, fontSize: 40, fontFamily: 'Speedrush'),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
            border: Border.all(color: const Color(0xFFFFD700), width: 7),
          ),
        ),
      ),
    );
  }
}
