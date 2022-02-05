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

testa(novaFoto) async {
  final File markerImageFile =
      await DefaultCacheManager().getSingleFile(novaFoto);
//  log(markerImageFile.toString());
  markerImageFile2 = markerImageFile;
}

class _FotoState extends State<Foto> {
  Conecta conectar = Conecta();

  @override
  void initState() {
//    testa();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
            const SizedBox(
              height: 50,
            ),
            FutureBuilder(
              future: conectar.getUsers(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<ClassUser>> snapshot) {
                if (snapshot.hasError) {
                  return const Text('erro');
                }
                if (snapshot.hasData) {
                  List<ClassUser>? posts = snapshot.data;
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(left: 15),
                        itemCount: posts?.length,
                        itemBuilder: (_, index) {
                          return InkWell(
                            onTap: () async {
                              await testa(posts![index].userFoto.toString());
                              setState(() {
                                temfoto = true;
                              });
                              //
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 110,
                                  height: 110,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            posts![index].userFoto),
                                        fit: BoxFit.cover),
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 110,
                                  height: 25,
                                  margin: const EdgeInsets.only(right: 15),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.4),
                                        spreadRadius: 0,
                                        blurRadius: 8,
                                        offset: const Offset(
                                            3, 3), // changes position of shadow
                                      ),
                                    ],
                                    color: Colors.blue[300],
                                    borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    posts[index].userNome,
                                    style: GoogleFonts.nunito(fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          );

                          /*
                          
                           InkWell(
                            onTap: () async {
                              await testa(posts![index].userFoto.toString());
                              setState(() {
                                temfoto = true;
                              });
                              //                             log(posts![index].userNome.toString());
                            },
                            child: Container(
                              width: 110,
                              height: 125,
                              margin: const EdgeInsets.only(
                                left: 15,
                                bottom: 12,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    spreadRadius: 0,
                                    blurRadius: 8,
                                    offset: const Offset(
                                        4, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 110,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      //            color: Colors.red,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              posts![index].userFoto),
                                          fit: BoxFit.cover),
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 110,
                                    height: 25,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.blue[300],
                                      borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                    ),
                                    child: Text(
                                      posts[index].userNome,
                                      style: GoogleFonts.nunito(fontSize: 16),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );

                          */
                        }),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

lala() {
  return InkWell(
    onTap: () async {},
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 110,
          height: 110,
          margin: const EdgeInsets.only(right: 15),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://xrhyhsbetlnzksauwrvi.supabase.in/storage/v1/object/public/login/odo7.jpg'),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
        ),
        Container(
          width: 110,
          height: 25,
          margin: const EdgeInsets.only(right: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          child: Text(
            'jj',
            style: GoogleFonts.nunito(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
