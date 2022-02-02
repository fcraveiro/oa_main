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
            children: [
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
              const SizedBox(
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
              height: 120,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 40),
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
          ],
        ),
      ),
    );
  }
}
