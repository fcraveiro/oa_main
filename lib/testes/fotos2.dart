import 'dart:io';

import 'package:flutter/material.dart';

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
          title: const Text('Foto Passada'),
          centerTitle: true,
          backgroundColor: const Color(0xFF48426D),
        ),
        body: Center(
          heightFactor: 1,
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.amber,
                child: Image.file(
                  widget.afoto,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ));
  }
}
