import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oa_main/model/model_teste.dart';
import 'package:oa_main/paginas/pacientes/controle_pacientes.dart';
import 'package:oa_main/services/config.dart';
import 'package:supabase/supabase.dart';

class Stream extends StatefulWidget {
  const Stream({Key? key}) : super(key: key);

  @override
  _FormTesteState createState() => _FormTesteState();
}

final client = SupabaseClient(supabaseUrl, supabaseKey);
int indexa2 = 0;
bool valor = true;

class _FormTesteState extends State<Stream> {
  List<ClassTeste> challengeModelList = [];

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'StreamBuilder',
          style: GoogleFonts.montserratAlternates(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.0,
          ),
        ),
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () => {
                  conectar.sair(),
                },
                child: const FaIcon(
                  Icons.exposure_minus_1,
                  size: 16,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () => {
                  conectar.ouvir(),
                },
                child: const FaIcon(
                  Icons.subscriptions,
                  size: 16,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () => {
                  valor = !valor,
                  conectar.updateTeste(valor),
                },
                child: const FaIcon(
                  FontAwesomeIcons.plus,
                  size: 16,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          )
        ],
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.green, // background
                  onPrimary: Colors.white, // foreground
                  fixedSize: const Size(100, 30)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancelar',
                style: GoogleFonts.nunito(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            StreamBuilder<List<Map<String, dynamic>>>(
                stream: client.from('teste').stream(['pacUuId']).execute(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return const Text('Erro');
                  } else {
                    log('Retorno ${snapshot.data.toString()}');
                    indexa2++;
                    log(indexa2.toString());
                    return Text('Retorno $indexa2');
                  }

                  /*
                  .hasData ||
                      snapshot.hasError ||
                      snapshot.data!.isEmpty) {
                    return Container();
                  }
                  log('BINGO');
                  for (var data in snapshot.data!) {
                    challengeModelList.add(ClassTeste.fromJson(data));
                  }
                  return Text(challengeModelList.first.tesText1);
                
                */
                }),

/*
                    for (var data in snapshot.data!) {
                      challengeModelList.add(ClassTeste.fromJson(data));
                    }
                    return Text(challengeModelList.first.tesText1);
*/
          ],
        ),
      ),
    );
  }
}
