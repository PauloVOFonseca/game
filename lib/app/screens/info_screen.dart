import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: Stack(
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
                  'Informações adicionais',
                  style: TextStyle(
                    fontFamily: 'IndieFlower',
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Clique nos textos para acessar diferentes sites e obter mais informações sobre obesidade',
                  style: TextStyle(
                    fontFamily: 'IndieFlower',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                infos(
                  '- Mapa da obesidade',
                  Uri.parse(
                      'https://abeso.org.br/obesidade-e-sindrome-metabolica/mapa-da-obesidade/'),
                ),
                infos(
                  '- Obesidade atinge um em cada quatro adultos no Brasil',
                  Uri.parse(
                      'https://g1.globo.com/jornal-nacional/noticia/2020/10/21/obesidade-atinge-um-em-cada-quatro-adultos-no-brasil-diz-ibge.ghtml'),
                ),
                infos(
                  '- Doenças ligadas a obesidade',
                  Uri.parse(
                      'https://www.ems.com.br/doencas-ligadas-a-obesidade-blog,27.html'),
                ),
                infos(
                  '- Projeto Enfrentamento da Obesidade e do Sobrepeso',
                  Uri.parse(
                      'https://www.gov.br/ans/pt-br/assuntos/gestaosaude/projeto-enfrentamento-da-obesidade-e-do-sobrepeso'),
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

  Widget infos(String text, url) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              if (await canLaunchUrl(url)) {
                await launchUrl(
                  url,
                  mode: LaunchMode.externalApplication,
                );
              }
            },
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'IndieFlower',
                fontSize: 25,
              ),
            ),
          ),
          const Icon(
            Icons.link,
            size: 40,
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
