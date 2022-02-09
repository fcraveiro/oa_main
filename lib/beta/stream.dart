import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oa_main/model/model_teste.dart';
import 'package:oa_main/paginas/pacientes/controle_pacientes.dart';
import 'package:oa_main/services/config.cfg';
import 'package:supabase/supabase.dart';

class Stream extends StatefulWidget {
  const Stream({Key? key}) : super(key: key);

  @override
  _FormTesteState createState() => _FormTesteState();
}

final client = SupabaseClient(supabaseUrl, supabaseKey);
int indexa2 = 0;
bool valor = true;

marca() {
  final campos = ClassTeste(
    tesUuId: '',
    tesText1: 'Novo',
    tesText2: 'Novaço',
    tesInt1: 1,
    tesBool1: true,
  );
  conectar.addTeste(campos);
}

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
          'Mensagens',
          style: GoogleFonts.montserratAlternates(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.0,
          ),
        ),
        actions: [
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () => {
//                  conectar.ouvir(),
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
                  marca(),
//                  valor = !valor,
//                  conectar.updateTeste(valor),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 0,
              ),
              Expanded(
                child: StreamBuilder<List<Map<String, dynamic>>>(
                    stream: client
                        .from('teste')
                        .stream(['pacUuId'])
                        .order('tesHora', ascending: false)
                        .execute(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return const Text('Erro');
                      } else {
                        log('Retorno ${snapshot.data.toString()}');
                        indexa2++;
                        log(indexa2.toString());
                        challengeModelList = [];
                        for (var data in snapshot.data!) {
                          challengeModelList.add(ClassTeste.fromJson(data));
                          log(data.toString());
                        }
                        return ListView.builder(
                          itemCount: challengeModelList.length,
                          itemBuilder: (BuildContext context, index) {
                            var teste =
                                challengeModelList[index].tesText1.toString();
                            return ListTile(
                              leading: CircleAvatar(
                                child: Text(
                                  teste.substring(0, 1).toUpperCase(),
                                ),
                              ),
                              title: Text(
                                challengeModelList[index].tesText1.toString(),
                                style: GoogleFonts.nunito(
                                  fontSize: 16,
                                ),
                              ),
                              trailing: const Icon(Icons.mail),
                            );
                          },
                        );
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
              ),

/*
                      for (var data in snapshot.data!) {
                        challengeModelList.add(ClassTeste.fromJson(data));
                      }
                      return Text(challengeModelList.first.tesText1);
*/
            ],
          ),
        ),
      ),
    );
  }
}
