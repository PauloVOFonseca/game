import 'dart:async';
import 'package:flutter/material.dart';

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
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 80,
                    alignment: Alignment.center,
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: TextStyle(fontSize: _size, color: Colors.black),
                      child: const Text(
                        'ObeGo',
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Continuar',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    'Novo jogo',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    'Como jogar',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    'Créditos',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            const Positioned(
              bottom: 30,
              right: 30,
              child: Icon(Icons.settings, size: 30, color: Colors.grey),
            ),
            const Positioned(
              top: 30,
              right: 30,
              child: Icon(Icons.star_outlined, size: 30, color: Colors.yellow),
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
