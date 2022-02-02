import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oa_main/model/pacientes.dart';
import '/services/conectar.dart';

class GravaPaciente extends StatefulWidget {
  const GravaPaciente({Key? key, required this.form}) : super(key: key);

  final ClassPaciente form;

  @override
  _MostraFormPacienteState createState() => _MostraFormPacienteState();
}

bool isZap = true;

class _MostraFormPacienteState extends State<GravaPaciente> {
  Conecta conectar = Conecta();

  @override
  Widget build(BuildContext context) {
    ClassPaciente form = widget.form;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Confirmar Cadastro',
          style: GoogleFonts.montserratAlternates(
            fontSize: 21,
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
                        builder: (context) => const Setup(),
                      )),
                      */
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
                        FontAwesomeIcons.bars,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          )
        ],
        centerTitle: true,
        backgroundColor: const Color(0xFF48426D),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    ' Confira os Dados Digitados',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 18,
                      color: Color(0xFF48426D),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              estilo('  Nome  ', form.pacNome),
              estilo('  Endereço  ', form.pacEnde),
              estilo('  Cidade  ', form.pacCity),
              estilo('  Estado  ', form.pacEst),
              estilo('  Cep  ', form.pacCep),
              estilo2('  Telefone  ', form.pacFone, form.pacZap1),
              estilo2('  Celular  ', form.pacCel, form.pacZap2),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green, // background
                          onPrimary: Colors.white, // foreground
                          fixedSize: const Size(145, 30)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Voltar a Editar'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF48426D), // background
                          onPrimary: Colors.white, // foreground
                          fixedSize: const Size(145, 30)),
                      onPressed: () {
                        _showToast(context);
                        conectar.addPaciente(form);
                        Navigator.of(context).pop('aaa');
                      },
                      child: const Text('Gravar Paciente'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  estilo(String descricao, campo) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 55,
      child: Stack(
        children: [
          Positioned(
            top: 9,
            child: Container(
              width: MediaQuery.of(context).size.width - 50,
              height: 40,
              margin: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.blue.shade400,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      campo.toString(),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(.7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 2,
            left: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    descricao,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      backgroundColor: Colors.white,
                      fontSize: 12,
                      color: Colors.blue.shade500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  estilo2(descricao, var campo, iszap) {
    bool iszap2 = false;
    if (iszap == true) {
      iszap2 = true;
    } else {
      iszap2 = false;
    }
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      margin: const EdgeInsets.only(top: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20,
                height: 55,
                child: Stack(
                  children: [
                    Positioned(
                      top: 9,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 50,
                        height: 40,
                        margin: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.blue.shade400,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                campo.toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black.withOpacity(.7),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 2,
                      left: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              descricao,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                backgroundColor: Colors.white,
                                fontSize: 12,
                                color: Colors.blue.shade500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2 - 40,
                height: 55,
                margin: const EdgeInsets.only(right: 30),
//                color: Colors.amber,
                child: Stack(
                  children: [
                    Positioned(
                      top: 9,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 50,
                        height: 40,
                        margin: const EdgeInsets.only(left: 5),
//                        color: Colors.teal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: Text(
                                'Whatsapp', //campo,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: iszap2
                                  ? const Icon(Icons.check_box,
                                      color: Colors.green)
                                  : const Icon(Icons.check_box_outline_blank,
                                      color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      const SnackBar(
        elevation: 10,
        backgroundColor: Color(0xFF48426D),
        duration: Duration(seconds: 2),
        content: Text(
          'Aguarde Salvando !!',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
