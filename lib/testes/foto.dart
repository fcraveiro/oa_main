import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oa_main/model/model_user.dart';
import 'package:oa_main/services/conectar.dart';

class Foto extends StatefulWidget {
  const Foto({Key? key}) : super(key: key);

  @override
  State<Foto> createState() => _FotoState();
}

bool temfoto = false;
late File markerImageFile2;

testa() async {
  final File markerImageFile = await DefaultCacheManager().getSingleFile(
      'https://xrhyhsbetlnzksauwrvi.supabase.in/storage/v1/object/public/login/odo3.jpg');
  log(markerImageFile.toString());
  markerImageFile2 = markerImageFile;
}

class _FotoState extends State<Foto> {
  Conecta conectar = Conecta();

  @override
  void initState() {
    testa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receber Foto'),
        centerTitle: true,
        backgroundColor: const Color(0xFF48426D),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(
          height: 70,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 7,
            fixedSize: const Size(220, 40),
            primary: const Color(0xFF48426D),
            onSurface: Colors.black,
          ),
          onPressed: () async {
            await testa();
            setState(() {
              temfoto = true;
            });
          },
          child: Text(
            'Foto',
            style: GoogleFonts.montserratAlternates(),
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
          onPressed: () async {
            temfoto ? Get.toNamed("/foto2/") : const Text('');
          },
          child: Text(
            'Passar a Foto',
            style: GoogleFonts.montserratAlternates(),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        temfoto
            ? Container(
                width: 200,
                height: 200,
                color: Colors.amber,
                child: Image.file(
                  markerImageFile2,
                  fit: BoxFit.contain,
                ),
              )
            : const Text('Aguardando'),
        Expanded(
          child: FutureBuilder(
            future: conectar.getUsers(),
            builder: (BuildContext context,
                AsyncSnapshot<List<ClassUser>> snapshot) {
              if (snapshot.hasError) {
                return const Text('erro');
              }
              if (snapshot.hasData) {
                List<ClassUser>? posts = snapshot.data;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: posts?.length,
                  itemBuilder: (_, index) {
                    return Text(posts![index].userNome.toString());
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ])),
    );
  }
}
