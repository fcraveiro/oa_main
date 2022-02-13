import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

var estilo1 = ElevatedButton.styleFrom(
  elevation: 7,
  fixedSize: const Size(220, 35),
  primary: const Color(0xFF48426D),
  onSurface: Colors.black,
);

var estilo2 = ElevatedButton.styleFrom(
  elevation: 7,
  fixedSize: const Size(155, 35),
  primary: const Color.fromARGB(255, 49, 112, 12),
  onSurface: Colors.black,
);

final box = GetStorage();
int userDentista = 0;
String fotoAtual = '';

class _MenuState extends State<Menu> {
  @override
  void initState() {
    userDentista = box.read('dentistaAtual');
    if (userDentista == 1) {
      fotoAtual = 'gabi';
    }
    if (userDentista == 2) {
      fotoAtual = 'vera';
    }
    if (userDentista == 3) {
      fotoAtual = 'regina';
    }
    super.initState();
  }

  texto(texto) {
    return Text(
      texto,
      style: GoogleFonts.montserratAlternates(),
    );
  }

  espaco() {
    return const SizedBox(
      height: 15,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Menu'),
        centerTitle: true,
        backgroundColor: const Color(0xFF48426D),
      ),
      body: Center(
        child: Column(
          children: [
            espaco(),
            ElevatedButton(
              style: estilo1,
              onPressed: () {
                Get.toNamed("/pacientes/");
              },
              child: texto('Pacientes'),
            ),
            ElevatedButton(
              style: estilo1,
              onPressed: () {
                Get.toNamed("/addpaciente/");
              },
              child: texto(
                'Adicionar Pacientes',
              ),
            ),
            ElevatedButton(
              style: estilo1,
              onPressed: () {
                Get.toNamed("/foto/");
              },
              child: texto(
                'Receber Fotos Bucket',
              ),
            ),
            espaco(),
            Align(
              alignment: AlignmentDirectional.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        style: estilo2,
                        onPressed: () {
                          Get.toNamed("/agenda/");
                        },
                        child: texto(
                          'Agenda',
                        ),
                      ),
                      ElevatedButton(
                        style: estilo2,
                        onPressed: () {
                          Get.toNamed("/setup/");
                        },
                        child: texto(
                          'Setup',
                        ),
                      ),
                      ElevatedButton(
                        style: estilo2,
                        onPressed: () {
                          Get.toNamed("/pin/");
                        },
                        child: texto(
                          'Pin',
                        ),
                      ),
                      ElevatedButton(
                        style: estilo2,
                        onPressed: () {
                          Get.toNamed("/grid/");
                        },
                        child: texto(
                          'Grid 1',
                        ),
                      ),
                      ElevatedButton(
                        style: estilo2,
                        onPressed: () {
                          Get.toNamed("/picker1/");
                        },
                        child: texto(
                          'Picker 1',
                        ),
                      ),
                      ElevatedButton(
                        style: estilo2,
                        onPressed: () {
                          Get.toNamed("/rpc/");
                        },
                        child: texto(
                          'Teste RPC',
                        ),
                      ),
                      ElevatedButton(
                        style: estilo2,
                        onPressed: () {
                          Get.toNamed("/existe/");
                        },
                        child: texto(
                          'Existe',
                        ),
                      ),
                      ElevatedButton(
                        style: estilo2,
                        onPressed: () {
                          Get.toNamed("/pagina1/");
                        },
                        child: texto(
                          'Som',
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        style: estilo2,
                        onPressed: () {
                          Get.toNamed("/picker2/");
                        },
                        child: texto(
                          'Picker 2',
                        ),
                      ),
                      ElevatedButton(
                        style: estilo2,
                        onPressed: () {
                          Get.toNamed("/profile/");
                        },
                        child: texto(
                          'Profile',
                        ),
                      ),
                      ElevatedButton(
                        style: estilo2,
                        onPressed: () {
                          Get.toNamed("/profile2/");
                        },
                        child: texto(
                          'Profile 2',
                        ),
                      ),
                      ElevatedButton(
                        style: estilo2,
                        onPressed: () {
                          Get.toNamed("/stream/");
                        },
                        child: texto(
                          'Stream',
                        ),
                      ),
                      ElevatedButton(
                        style: estilo2,
                        onPressed: () {
                          Get.toNamed("/picker3/");
                        },
                        child: texto(
                          'Picker & Crooper',
                        ),
                      ),
                      ElevatedButton(
                        style: estilo2,
                        onPressed: () {
                          Get.toNamed("/encrypt/");
                        },
                        child: texto(
                          'Encrypt',
                        ),
                      ),
                      ElevatedButton(
                        style: estilo2,
                        onPressed: () {
                          Get.toNamed("/bateria/");
                        },
                        child: texto(
                          'Bateria',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

final box = GetStorage();
int userDentista = 0;
String fotoAtual = '';

class _MenuState extends State<Menu> {
  @override
  void initState() {
    userDentista = box.read('dentistaAtual');
    if (userDentista == 1) {
      fotoAtual = 'gabi';
    }
    if (userDentista == 2) {
      fotoAtual = 'vera';
    }
    if (userDentista == 3) {
      fotoAtual = 'regina';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Menu'),
        centerTitle: true,
        backgroundColor: const Color(0xFF48426D),
        actions: [
          Row(
            children: const [
/*
              GestureDetector(
                onTap: () => {},
                child: Container(
                  width: 41,
                  height: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                      image: DecorationImage(
                        image: ExactAssetImage('assets/imagens/$fotoAtual.png'),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      )),
                ),
              ),

              */
              SizedBox(
                width: 17,
              ),
            ],
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 35),
                primary: const Color(0xFF48426D),
                onSurface: Colors.black,
              ),
              onPressed: () {
                Get.toNamed("/pacientes/");
              },
              child: Text(
                'Pacientes',
                style: GoogleFonts.montserratAlternates(),
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 35),
                primary: const Color(0xFF48426D),
                onSurface: Colors.black,
              ),
              onPressed: () {
                Get.toNamed("/addpaciente/");
              },
              child: Text(
                'Adicionar Pacientes',
                style: GoogleFonts.montserratAlternates(),
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 35),
                primary: const Color(0xFF48426D),
                onSurface: Colors.black,
              ),
              onPressed: () {
                Get.toNamed("/foto/");
              },
              child: Text(
                'Receber Fotos Bucket',
                style: GoogleFonts.montserratAlternates(),
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 35),
                primary: const Color.fromARGB(255, 49, 112, 12),
                onSurface: Colors.black,
              ),
              onPressed: () {
                Get.toNamed("/agenda/");
              },
              child: Text(
                'Agenda',
                style: GoogleFonts.montserratAlternates(),
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 35),
                primary: const Color.fromARGB(255, 49, 112, 12),
                onSurface: Colors.black,
              ),
              onPressed: () {
                Get.toNamed("/setup/");
              },
              child: Text(
                'Setup',
                style: GoogleFonts.montserratAlternates(),
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 35),
                primary: const Color.fromARGB(255, 49, 112, 12),
                onSurface: Colors.black,
              ),
              onPressed: () {
                Get.toNamed("/pin/");
              },
              child: Text(
                'Pin',
                style: GoogleFonts.montserratAlternates(),
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 35),
                primary: const Color.fromARGB(255, 49, 112, 12),
                onSurface: Colors.black,
              ),
              onPressed: () {
                Get.toNamed("/grid/");
              },
              child: Text(
                'Grid 1',
                style: GoogleFonts.montserratAlternates(),
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 35),
                primary: const Color.fromARGB(255, 49, 112, 12),
                onSurface: Colors.black,
              ),
              onPressed: () {
                Get.toNamed("/picker1/");
              },
              child: Text(
                'Picker 1',
                style: GoogleFonts.montserratAlternates(),
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 35),
                primary: const Color.fromARGB(255, 49, 112, 12),
                onSurface: Colors.black,
              ),
              onPressed: () {
                Get.toNamed("/picker2/");
              },
              child: Text(
                'Picker 2',
                style: GoogleFonts.montserratAlternates(),
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 35),
                primary: const Color.fromARGB(255, 49, 112, 12),
                onSurface: Colors.black,
              ),
              onPressed: () {
                Get.toNamed("/profile/");
              },
              child: Text(
                'Profile',
                style: GoogleFonts.montserratAlternates(),
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 35),
                primary: const Color.fromARGB(255, 49, 112, 12),
                onSurface: Colors.black,
              ),
              onPressed: () {
                Get.toNamed("/profile2/");
              },
              child: Text(
                'Profile 2',
                style: GoogleFonts.montserratAlternates(),
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 35),
                primary: const Color.fromARGB(255, 49, 112, 12),
                onSurface: Colors.black,
              ),
              onPressed: () {
                Get.toNamed("/stream/");
              },
              child: Text(
                'Stream',
                style: GoogleFonts.montserratAlternates(),
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 35),
                primary: const Color.fromARGB(255, 49, 112, 12),
                onSurface: Colors.black,
              ),
              onPressed: () {
                Get.toNamed("/picker3/");
              },
              child: Text(
                'Picker & Crooper',
                style: GoogleFonts.montserratAlternates(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


*/
