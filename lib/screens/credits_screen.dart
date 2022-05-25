import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CreditsScreen extends StatefulWidget {
  const CreditsScreen({Key? key}) : super(key: key);

  @override
  State<CreditsScreen> createState() => _CreditsScreenState();
}

class _CreditsScreenState extends State<CreditsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/menu_background.png',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Créditos',
                    style: TextStyle(
                      fontFamily: 'IndieFlower',
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Engine: Flame',
                    style: TextStyle(
                      fontFamily: 'IndieFlower',
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  // const Text(
                  //   'Trilha sonora: Flame',
                  //   style: TextStyle(
                  //     fontFamily: 'IndieFlower',
                  //     fontSize: 30,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  // const Text(
                  //   'Efeitos sonoros: Flame',
                  //   style: TextStyle(
                  //     fontFamily: 'IndieFlower',
                  //     fontSize: 30,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () async {
                      if (await canLaunchUrl(
                          Uri.parse('https://superdark.itch.io'))) {
                        await launchUrl(
                          Uri.parse('https://superdark.itch.io'),
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    },
                    child: const Text(
                      'Visual: Superdark',
                      style: TextStyle(
                        fontFamily: 'IndieFlower',
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Text(
                    'Fonte textual: Pixesia Studio',
                    style: TextStyle(
                      fontFamily: 'IndieFlower',
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Editor de mapas: Tiled Map Editor',
                    style: TextStyle(
                      fontFamily: 'IndieFlower',
                      fontSize: 30,
                      color: Colors.white,
                    ),
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
      ),
    );
  }
}
