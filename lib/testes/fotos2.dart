import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fotos2 extends StatefulWidget {
  const Fotos2({Key? key, required this.afoto}) : super(key: key);

  final File afoto;

  @override
  State<Fotos2> createState() => _Fotos2State();
}

class _Fotos2State extends State<Fotos2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Pacientes',
            style: GoogleFonts.montserratAlternates(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.0,
            ),
          ),
          actions: [
            Row(
              children: [
                Container(
                  width: 41,
                  height: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                      image: DecorationImage(
                          image: FileImage(widget.afoto), fit: BoxFit.cover),

//image: const DecorationImage(image: NetworkImage("urlImage"),
//      fit: BoxFit.cover),
//                    image: DecorationImage(
//Image.file(widget.afoto),
//                      image: ExactAssetImage('assets/imagens/$fotoAtual.png'),
//                      fit: BoxFit.cover,
//                    ),
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      )),
                ),
                const SizedBox(
                  width: 17,
                ),
              ],
            )
          ],
          centerTitle: true,
          backgroundColor: const Color(0xFF48426D),
        ),
        body: Center(
          heightFactor: 1,
          child: Column(
            children: const [
              SizedBox(
                height: 70,
              ),
/*
              Container(
                width: 200,
                height: 200,
                color: Colors.amber,
                child: Image.file(
                  widget.afoto,
                  fit: BoxFit.contain,
                ),
              ),

*/
            ],
          ),
        ));
  }
}
