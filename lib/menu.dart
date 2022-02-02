import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oa_main/inicio.dart';

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
              height: 90,
            ),
            Text(
              'Dentista',
              style: GoogleFonts.nunito(
                  fontSize: 20, letterSpacing: .1, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 45,
            ),
            ElevatedButton(
              style: const ButtonStyle(),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Inicio(),
                  ),
                );
              },
              child: Text(
                dentistaAtual.toString(),
                style: GoogleFonts.montserratAlternates(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
