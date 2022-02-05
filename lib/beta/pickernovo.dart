import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Picker2 extends StatefulWidget {
  const Picker2({Key? key}) : super(key: key);

  @override
  State<Picker2> createState() => _Picker2State();
}

class _Picker2State extends State<Picker2> {
  File? image;

  Future pickImage(source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      log('Falha $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imagem para o Histórico'),
        centerTitle: true,
        backgroundColor: const Color(0xFF48426D),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            image != null
                ? Image.file(
                    image!,
                    width: 300,
                    height: 340,
                    fit: BoxFit.cover,
                  )
                : const FlutterLogo(
                    size: 160,
                  ),
            const SizedBox(
              height: 60,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 40),
                primary: const Color(0xFF48426D),
                onSurface: Colors.black,
              ),
              onPressed: () {
                pickImage(ImageSource.camera);
              },
              child: Text(
                'Fotos',
                style: GoogleFonts.nunito(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 40),
                primary: const Color(0xFF48426D),
                onSurface: Colors.black,
              ),
              onPressed: () {
                pickImage(ImageSource.gallery);
              },
              child: Text(
                'Galeria',
                style: GoogleFonts.nunito(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
