import 'dart:developer';
import 'package:oa_main/menu.dart';
import 'package:oa_main/services/bouncypage.dart';
import 'package:oa_main/services/conectar.dart';
import 'package:oa_main/services/config.dart';
import '/model/pacientes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oa_fone/oa_fone.dart';
import 'package:supabase/supabase.dart';
import 'controle_pacientes.dart';

class Pacientes extends StatefulWidget {
  const Pacientes({Key? key}) : super(key: key);

  @override
  _PacientesState createState() => _PacientesState();
}

final client = SupabaseClient(supabaseUrl, supabaseKey);
final TextEditingController _nomeController = TextEditingController();

List<ClassPaciente> lista = [];
int selecionados = 0;
List filteredPacientes = [];
int userDentista = 0;
final box = GetStorage();
String fotoAtual = '';

Color corEscolha1 = const Color(0xFF48426D);
Color corEscolha2 = const Color(0xFF48426D);
Color corEscolha3 = const Color(0xFF48426D);
bool pesquisandoFavorito = false;

class _PacientesState extends State<Pacientes> {
  Conecta conectar = Conecta();

  @override
  void initState() {
    if (box.read('dentistaAtual') == null) {
      box.write('dentistaAtual', 1);
    }
    userDentista = box.read('dentistaAtual');
    if (userDentista == 1) {
      fotoAtual = 'gabi';
    }
    if (userDentista == 2) {
      fotoAtual = 'vera';
    }
    if (userDentista == 3) {
      fotoAtual = 'regina';
    }

    lista = [];
    limpaPesquisa();
    lerAgora();
    setState(() {
      lista;
      filteredPacientes = lista;
    });
    _nomeController.text = '';
    super.initState();
  }

  lerAgora3() async {
    log('future');
    FutureBuilder(
      future: conectar.getAll2(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ClassPaciente>> snapshot) {
        if (snapshot.hasData) {
          log('caralho');
          List<ClassPaciente>? lista = snapshot.data;
          log(lista.toString());
        } else {
          return const Center(child: CircularProgressIndicator());
        }
        throw 'erro';
      },
    );
  }

  Future lerAgora2() async {
    FutureBuilder(
      future: conectar.getAll2(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ClassPaciente>> snapshot) {
        if (snapshot.connectionState == ConnectionState.none) {
          log('Sem Conexão');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          log('Aguardando Dados');
        } else if (snapshot.hasError) {
          log('Erro de Leitura');
        } else if (snapshot.hasData) {
          log('dados');
          log(snapshot.data.toString());
        }
        throw 'erro';
      },
    );
    setState(() {});
  }

  Future<List<ClassPaciente>> lerAgora() async {
//    log('Lendo ....');
    final response = await client
        .from('pacientes')
        .select()
        .eq('pacDentista', userDentista)
        .order('pacNome', ascending: true)
        .execute();
//    log(lista.toString());
    if (response.error == null) {
      final dataList = response.data as List;
//      log(dataList.length.toString());
      for (var i = 0; i < dataList.length; i++) {
        var evento = (ClassPaciente.fromJson(dataList[i]));
        lista.add(
          ClassPaciente(
            pacUuId: evento.pacUuId,
            pacDentista: evento.pacDentista,
            pacNome: evento.pacNome,
            pacEnde: evento.pacEnde,
            pacCity: evento.pacCity,
            pacEst: evento.pacEst,
            pacCep: evento.pacCep,
            pacFone: evento.pacFone,
            pacCel: evento.pacCel,
            pacZap1: evento.pacZap1,
            pacZap2: evento.pacZap2,
            pacFavorito: evento.pacFavorito,
            pacTratando: evento.pacTratando,
            pacRemarcado: evento.pacRemarcado,
            pacCompleto: evento.pacCompleto,
            pacAviso1: evento.pacAviso1,
            pacAviso2: evento.pacAviso2,
            pacAviso3: evento.pacAviso3,
            pacAviso4: evento.pacAviso4,
            pacAviso5: evento.pacAviso5,
            pacAviso6: evento.pacAviso6,
          ),
        );
        setState(() {
          lista;
        });
      }
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
//      backgroundColor: const Color(0xFF373258),
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
              GestureDetector(
                onTap: () => {
/*
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddPaciente(),
                      )
                      
                      
                      
                      ),

*/
                },
/*
                  FocusScope.of(context).requestFocus(FocusNode()),
                  limpaPesquisa(),
                  mostraTodos(),
                  setState(() {}),

                  */
                child: Container(
                  width: 41,
                  height: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                      image: DecorationImage(
                        image: ExactAssetImage('assets/imagens/$fotoAtual.png'),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      )),
                ),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 125,
              decoration: const BoxDecoration(
                color: Color(0xFF48426D),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  campoDePesquisa(),
                  const SizedBox(
                    height: 8,
                  ),
                  escolha1(),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
            Expanded(
              child: filteredPacientes.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Text(
                          'Nada encontrado',
                          style: GoogleFonts.lato(
                            color: const Color(0xFF373258),
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text('nçao tem'),
//                        LottieBuilder.asset('assets/imagens/notfound.json'),
                      ],
                    )
                  : ListView.builder(
                      itemCount: filteredPacientes.length,
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 70),
                      itemBuilder: (__, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                          child: Slidable(
                            groupTag: '1',
                            key: const ValueKey(0),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    log('Botão 1');
                                  },
                                  backgroundColor: const Color(0xFF66BB6A),
                                  foregroundColor: Colors.white,
                                  icon: Icons.phone_iphone,
                                  label: 'Ligar',
                                ),
                                SlidableAction(
                                  onPressed: (context) {
                                    log('Botão 2');
                                  },
                                  backgroundColor: const Color(0xFF26A69A),
                                  foregroundColor: Colors.white,
                                  icon: Icons.calendar_today,
                                  label: 'Agendar',
                                ),
                              ],
                            ),
                            child: mostra2(index),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget escolha1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => {
                    _nomeController.clear(),
                    FocusScope.of(context).requestFocus(FocusNode()),
                    pesquisandoFavorito = true,
                    pesqFavorito(),
                    setState(() {}),
                  },
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: corEscolha1,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: quadroEscolhas(
                        FontAwesomeIcons.solidHeart, 'Favoritos'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () => {
                    _nomeController.clear(),
                    FocusScope.of(context).requestFocus(FocusNode()),
                    pesqTratando(),
                    setState(() {}),
                  },
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: corEscolha2,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: quadroEscolhas(FontAwesomeIcons.tooth, 'Tratando'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () => {
                    _nomeController.clear(),
                    FocusScope.of(context).requestFocus(FocusNode()),
                    pesqRemarcado(),
                    setState(() {}),
                  },
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: corEscolha3,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: quadroEscolhas(
                        FontAwesomeIcons.calendarAlt, 'Remarcou'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

//  exibe() {}

  mostra2(index) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            log('Clicado 2');
            Navigator.push(
              context,
              BouncyPageRoute(
//                  widget: Paciente(
//                      filteredPacientes: filteredPacientes, index: index),

                widget: const Menu(),
              ),
            );
          },
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 65,
                padding: const EdgeInsets.all(50),
//                color: Colors.red,
              ),
              Positioned(
                top: 08,
                left: 10,
                child: SizedBox(
                  width: 310,
                  height: 20,
                  child: Text(
                    filteredPacientes[index].pacNome.toString(),
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.black.withOpacity(.8),
                          letterSpacing: 0.2,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              //////////////////////////////////////////////////////////////////
              Positioned(
                top: 33,
                left: 10,
                child: InkWell(
                  onTap: () => ligarContato(
                    context,
                    filteredPacientes[index].pacFone,
                    filteredPacientes[index].pacCel,
                    filteredPacientes[index].pacZap1,
                    filteredPacientes[index].pacZap2,
                  ),
                  child: Container(
                    width: 110,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      border: Border.all(
                        color: Colors.white.withOpacity(.4),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '   ' + filteredPacientes[index].pacFone.toString(),
                          style: GoogleFonts.montserrat(
                              color: Colors.black.withOpacity(.8),
                              letterSpacing: 0.2,
                              fontSize: 13,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    mudaFavorito(index);
                    pesquisandoFavorito ? pesqFavorito() : {};
                    setState(() {});
                  },
                  child: SizedBox(
                    height: 45,
                    width: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        filteredPacientes[index].pacFavorito
                            ? const FaIcon(
                                FontAwesomeIcons.solidHeart,
                                color: Colors.grey,
                              )
                            : const FaIcon(
                                FontAwesomeIcons.heart,
                                color: Colors.grey,
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 75, right: 90),
          child: Divider(
            color: Colors.grey[400],
            height: 1,
            thickness: 1,
          ),
        )
      ],
    );
  }

  campoDePesquisa() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 00,
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              height: 40,
              child: TextField(
                controller: _nomeController,
                cursorColor: Colors.grey,
                onTap: () => {
                  limpaPesquisa(),
                  mostraTodos(),
                },
                onChanged: (value) {
                  pesqNome(value);
                  setState(() {
                    filteredPacientes;
                  });
                },
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(0),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  labelText: "Nome",
                  labelStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFFECC08C).withOpacity(.5),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFFECC08C).withOpacity(.5),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => {
                _nomeController.clear(),
                FocusScope.of(context).requestFocus(FocusNode()),
                limpaPesquisa(),
                mostraTodos(),
                setState(() {}),
              },
              child: Container(
                width: 45,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  border: Border.all(
                    color: const Color(0xFF757575),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.redo,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

quadroEscolhas(icone, String texto) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Row(
      children: [
        FaIcon(
          icone,
          size: 16,
          color: const Color(0xFFECC08C),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          texto,
          style: GoogleFonts.montserratAlternates(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ],
    ),
  );
}
