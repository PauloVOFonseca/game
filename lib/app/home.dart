import 'dart:async';
import 'package:flutter/material.dart';
import 'package:game/app/screens/credits_screen.dart';
import 'package:game/app/screens/info_screen.dart';
import 'package:game/app/screens/levels/levels_screen.dart';
import 'package:game/app/teste/teste2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? timer;
  double _size = 50;
  bool _sizeIncreaser = true;

  @override
  void initState() {
    super.initState();
    Timer.periodic(
        const Duration(milliseconds: 300), (Timer t) => changeTextSize());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/menu_background.png',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Container(
                    height: 80,
                    alignment: Alignment.center,
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: TextStyle(
                        fontFamily: 'Speedrush',
                        fontSize: _size,
                        color: Colors.black,
                      ),
                      child: const Text(
                        'ObeGo',
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LevelsScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Jogar',
                      style: TextStyle(
                        fontFamily: 'IndieFlower',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Teste2(),
                        ),
                      );
                    },
                    child: const Text(
                      'Como jogar',
                      style: TextStyle(
                        fontFamily: 'IndieFlower',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreditsScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Créditos',
                      style: TextStyle(
                        fontFamily: 'IndieFlower',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              bottom: 40,
              right: 30,
              child: Icon(
                Icons.music_note,
                size: 40,
                color: Color(0xFF2E3035),
              ), //.music_off
            ),
            const Positioned(
              top: 30,
              right: 30,
              child: Icon(Icons.star, size: 40, color: Colors.yellow),
            ),
            Positioned(
              top: 30,
              right: 80,
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InfoScreen(),
                  ),
                ),
                child: const Icon(Icons.info_outline,
                    size: 40, color: Colors.indigo),
              ),
            ),
          ],
        ),
      ),
    );
  }

  changeTextSize() {
    if (_size == 80) {
      _sizeIncreaser = false;
      setState(() => _size -= 10);
    } else if (_size == 50) {
      _sizeIncreaser = true;
      setState(() => _size += 10);
    } else {
      setState(() => _size += _sizeIncreaser ? 10 : -10);
    }
  }
}
