import 'dart:developer';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oa_main/model/model_encrypt.dart';
import 'package:oa_main/services/conectar.dart';

class Encrypt extends StatefulWidget {
  const Encrypt({Key? key}) : super(key: key);

  @override
  State<Encrypt> createState() => _EncryptState();
}

var aa2 = 0;

// ignore: prefer_typing_uninitialized_variables
var cococo;

class _EncryptState extends State<Encrypt> {
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
        title: const Text('Remote Procedure Call'),
        centerTitle: true,
        backgroundColor: const Color(0xFF48426D),
        actions: [
          Center(child: Text(aa2.toString())),
          const SizedBox(
            width: 15,
          ),
        ],
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
              onPressed: () async {},
              child: Text(
                'Votar Marcio',
                style: GoogleFonts.montserratAlternates(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            FutureBuilder(
              future: conectar.getEncrypt(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<ClassEncrypt>> snapshot) {
                if (snapshot.hasError) {
                  return const Text('erro');
                }
                if (snapshot.hasData) {
                  List<ClassEncrypt>? posts = snapshot.data;
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(left: 15),
                        itemCount: posts?.length,
                        itemBuilder: (_, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              senha3(),
                              SizedBox(
                                  width: 160,
                                  child: Text(
                                    posts![index].encNome.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.nunito(
                                      fontSize: 16,
                                    ),
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                  width: 160,
                                  child: Text(
                                    posts[index].encNome2.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.nunito(
                                      fontSize: 16,
                                    ),
                                  )),
                            ],
                          );
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

  senha3() {
    senha();
    return Text(cococo.toString());
  }
}

void senha() {
  const plainText = 'Carlos Fernando';

  final key = encrypt.Key.fromSecureRandom(32);
  final iv = encrypt.IV.fromSecureRandom(16);
  final encrypter = encrypt.Encrypter(encrypt.AES(key));

  final encrypted = encrypter.encrypt(plainText, iv: iv);

  cococo = encrypted.base64;

  log('2o ${encrypted.toString()}');
  log('1o ${encrypter.toString()}');

//  final teste = encrypted;
  final decrypted = encrypter.decrypt(cococo, iv: iv);
  log('3o ${decrypted.toString()}');

//  log(decrypted);
//  log(encrypted.bytes.toString());
//  log(encrypted.base16);
//  log(encrypted.base64);
}


/*

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oa_main/model/model_testerls.dart';
import 'package:oa_main/services/conectar.dart';

class TesteRls extends StatefulWidget {
  const TesteRls({Key? key}) : super(key: key);

  @override
  State<TesteRls> createState() => _TesteRlsState();
}

var aa2 = 0;

class _TesteRlsState extends State<TesteRls> {
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
        title: const Text('Remote Procedure Call'),
        centerTitle: true,
        backgroundColor: const Color(0xFF48426D),
        actions: [
          Center(child: Text(aa2.toString())),
          const SizedBox(
            width: 15,
          ),
        ],
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
                conectar.rpc1();
              },
              child: Text(
                'Votar Pedro',
                style: GoogleFonts.montserratAlternates(
                  fontSize: 16,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 40),
                primary: const Color(0xFF48426D),
                onSurface: Colors.black,
              ),
              onPressed: () async {
                conectar.rpc2();
              },
              child: Text(
                'Votar Paulo',
                style: GoogleFonts.montserratAlternates(
                  fontSize: 16,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 40),
                primary: const Color(0xFF48426D),
                onSurface: Colors.black,
              ),
              onPressed: () async {
                conectar.rpc3();
              },
              child: Text(
                'Votar Marcio',
                style: GoogleFonts.montserratAlternates(
                  fontSize: 16,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 40),
                primary: const Color(0xFF48426D),
                onSurface: Colors.black,
              ),
              onPressed: () async {
                conectar.rpc4(15);
              },
              child: Text(
                'Votar Parametro',
                style: GoogleFonts.montserratAlternates(
                  fontSize: 16,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 7,
                fixedSize: const Size(220, 40),
                primary: const Color(0xFF48426D),
                onSurface: Colors.black,
              ),
              onPressed: () async {
                aa2 = await conectar.rpc5();
                setState(() {
                  aa2;
                });
              },
              child: Text(
                'Retorno',
                style: GoogleFonts.montserratAlternates(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            FutureBuilder(
              future: conectar.getRLS(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<ClassTesteRls>> snapshot) {
                if (snapshot.hasError) {
                  return const Text('erro');
                }
                if (snapshot.hasData) {
                  List<ClassTesteRls>? posts = snapshot.data;
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(left: 15),
                        itemCount: posts?.length,
                        itemBuilder: (_, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                posts![index].tes2Nome.toString(),
                                style: GoogleFonts.nunito(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                  width: 50,
                                  child: Text(
                                    posts[index].tes2Int1.toString(),
                                    style: GoogleFonts.nunito(
                                      fontSize: 16,
                                    ),
                                  )),
                            ],
                          );
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







import 'package:flutter/material.dart';
import 'package:oa_main/beta/senha.dart';

class Encrypt extends StatefulWidget {
  const Encrypt({Key? key}) : super(key: key);

  @override
  State<Encrypt> createState() => _EncryptState();
}

class _EncryptState extends State<Encrypt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Encrypt'),
        actions: [
          GestureDetector(
            onTap: () => senha3(),
            child: const Icon(Icons.ac_unit_rounded),
          )
        ],
      ),
      body: Column(
        children: const [
          Text('aa'),
        ],
      ),
    );
  }

  senha3() {
    senha();
  }
}

*/