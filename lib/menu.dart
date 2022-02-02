import 'dart:developer';
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
int dentistaAtual = 0;

class _MenuState extends State<Menu> {
  @override
  void initState() {
    dentistaAtual = box.read('dentistaAtual');
    log('Dentista Atual = ${dentistaAtual.toString()}');
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
