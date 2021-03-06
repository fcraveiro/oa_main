import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_actions/quick_actions.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

final box = GetStorage();
List fotos = [
  'odo1',
  'odo2',
  'odo3',
  'odo4',
  'odo5',
  'odo6',
  'odo7',
];

class _InicioState extends State<Inicio> {
  final QuickActions quickActions = const QuickActions();

  @override
  void initState() {
    log('Entrou tela Inicial');
    if (box.read('dentistaAtual') == null) {
      box.write('dentistaAtual', 1);
    }

    quickActions.setShortcutItems([
      const ShortcutItem(
        type: 'pacientes',
        localizedTitle: 'Pacientes',
        icon: 'pacientes',
      ),
      const ShortcutItem(
        type: 'addpaciente',
        localizedTitle: 'Add Paciente',
        icon: 'addpaciente',
      ),
      const ShortcutItem(
        type: 'foto',
        localizedTitle: 'Foto',
        icon: 'foto',
      ),
    ]);
    quickActions.initialize((type) {
      if (type == 'pacientes') {
        Get.toNamed("/pacientes/");
      }
      if (type == 'addpaciente') {
        Get.toNamed("/addpaciente/");
      }
      if (type == 'foto') {
        Get.toNamed("/foto/");
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  customHeader(),
                ],
              ),
              Positioned(
                top: 450,
                right: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  alignment: Alignment.center,
//                  color: Colors.pink,
                  child: Text(
                    'Login',
                    style: GoogleFonts.nunito(fontSize: 20, letterSpacing: .2),
                  ),
                ),
              ),
              Positioned(
                top: 480,
                right: 0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 140,
                  child: ListView.builder(
                    shrinkWrap: false,
//                    padding: const EdgeInsets.only(left: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, i) {
                      return fotosEntrada(fotos[i], i);
                    },
                  ),
                ),
              ),
              //            CustomBottomBar(),
              //            PlayButton(),
            ],
          ),
        ),
      ),
    );
  }

  fotosEntrada(String foto, int valor) {
    return InkWell(
      onTap: () {
        box.write('dentistaAtual', valor + 1);
        log(valor.toString());
        Get.toNamed("/menu/");
      },
      child: Container(
        width: 100,
        height: 60,
        margin: const EdgeInsets.only(right: 15, top: 15, bottom: 15, left: 15),
        decoration: BoxDecoration(
//          color: Colors.amber,
          image: DecorationImage(
            image: AssetImage('assets/imagens/$foto.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(3, 6), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}

customHeader() {
  return Stack(
    alignment: Alignment.topCenter,
    children: <Widget>[
      headerBackground(),
      Container(
        alignment: Alignment.center,
        height: 460,
        padding: const EdgeInsets.fromLTRB(30, 30, 20, 0),
      ),
      Container(
        width: 150,
        height: 150,
        margin: const EdgeInsets.only(top: 275),
        decoration: BoxDecoration(
          image:
              const DecorationImage(image: AssetImage('assets/imagens/oa.png')),
          borderRadius: BorderRadius.circular(35),
        ),
      ),
    ],
  );
}

headerBackground() {
  return Stack(
    alignment: Alignment.topCenter,
    children: <Widget>[
      Container(
        width: 150,
        height: 150,
        margin: const EdgeInsets.only(top: 275),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 55, spreadRadius: 3, color: Colors.blueGrey.shade800)
        ]),
      ),
      ClipPath(
        clipper: HeaderClipper(),
        child: Container(
          margin: const EdgeInsets.only(top: 5),
          height: 450,
          color: Colors.white,
        ),
      ),
      ClipPath(
        clipper: HeaderClipper(),
        child: Container(
          height: 450,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/imagens/fundo.png'),
                fit: BoxFit.cover),
          ),
        ),
      ),
    ],
  );
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;
    path.lineTo(sw, 0);
    path.lineTo(sw, sh);
    path.cubicTo(sw, sh * 0.7, 0, sh * 0.8, 0, sh * 0.55);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BottomBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;
    path.lineTo(4 * sw / 12, 0);
    path.cubicTo(
        5 * sw / 12, 0, 5 * sw / 12, 2 * sh / 5, 6 * sw / 12, 2 * sh / 5);
    path.cubicTo(7 * sw / 12, 2 * sh / 5, 7 * sw / 12, 0, 8 * sw / 12, 0);
    path.lineTo(sw, 0);
    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
