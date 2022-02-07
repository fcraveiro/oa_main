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
          'Incluir Pacientes',
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
                  conectar.ouvir(),
                  log('passou'),
                },
                child: const FaIcon(
                  FontAwesomeIcons.bars,
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
                stream: client.from('teste').stream([]).execute(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                  if (!snapshot.hasData ||
                      snapshot.hasError ||
                      snapshot.data!.isEmpty) {
                    return Container();
                  }
                  for (var data in snapshot.data!) {
                    challengeModelList.add(ClassTeste.fromJson(data));
                  }
                  return Text(challengeModelList.first.tesText1);
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
