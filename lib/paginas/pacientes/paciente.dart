/*
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oa_fone/oa_fone.dart';

//import 'modal.dart';

class Paciente extends StatefulWidget {
  const Paciente({
    Key? key,
    required this.filteredPacientes,
    required this.index,
  }) : super(key: key);

//  final ClassPaciente post;
  final List filteredPacientes;
  final int index;

  @override
  _PacienteState createState() => _PacienteState();
}

List filteredPacientes = [];
int index = 0;

class _PacienteState extends State<Paciente> {
  @override
  void initState() {
//    log(widget.filteredPacientes.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    filteredPacientes = widget.filteredPacientes;
    index = widget.index;

    return Scaffold(
//      backgroundColor: Colors.deepOrange,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              'Paciente',
              style: GoogleFonts.montserratAlternates(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.0,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            filteredPacientes[index].pacFavorito
                ? const FaIcon(
                    FontAwesomeIcons.solidHeart,
                    size: 16,
                  )
                : const Text(''),
          ],
        ),
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () => {
                  ligarContato(
                    context,
                    filteredPacientes[index].pacFone,
                    filteredPacientes[index].pacCel,
                    filteredPacientes[index].pacZap1,
                    filteredPacientes[index].pacZap2,
                  ),
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
                        FontAwesomeIcons.phoneAlt,
                        size: 18,
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
      body: Center(
        heightFactor: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 75,
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
                ),
                Positioned(
                  top: 10,
                  left: 20,
                  child: Text(
                    filteredPacientes[index].pacNome.toString(),
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: .1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Positioned(
                  top: 38,
                  left: 20,
                  child: Text(
                    filteredPacientes[index].pacFone.toString(),
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 14,
                      letterSpacing: .1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'UuID               ${filteredPacientes[index].pacUuId.toString()}'),
                    Text(
                        'Dentista         ${filteredPacientes[index].pacDentista.toString()}'),
                    Text(
                        'Nome             ${filteredPacientes[index].pacNome.toString()}'),
                    Text(
                        'Endereço       ${filteredPacientes[index].pacEnde.toString()}'),
                    Text(
                        'Cidade           ${filteredPacientes[index].pacCity.toString()}'),
                    Text(
                        'Estado           ${filteredPacientes[index].pacEst.toString()}'),
                    Text(
                        'Cep                ${filteredPacientes[index].pacCep.toString()}'),
                    Text(
                        'Fone              ${filteredPacientes[index].pacFone.toString()}'),
                    Text(
                        'Celular           ${filteredPacientes[index].pacCel.toString()}'),
                    Text(
                        'Zap1               ${filteredPacientes[index].pacZap1.toString()}'),
                    Text(
                        'Zap2               ${filteredPacientes[index].pacZap2.toString()}'),
                    Text(
                        'Favorito          ${filteredPacientes[index].pacFavorito.toString()}'),
                    Text(
                        'Tratando        ${filteredPacientes[index].pacTratando.toString()}'),
                    Text(
                        'Remarcado    ${filteredPacientes[index].pacRemarcado.toString()}'),
                    Text(
                        'Completo       ${filteredPacientes[index].pacCompleto.toString()}'),
                    Text(
                        'Aviso 1           ${filteredPacientes[index].pacAviso1.toString()}'),
                    Text(
                        'Aviso 2           ${filteredPacientes[index].pacAviso2.toString()}'),
                    Text(
                        'Aviso 3           ${filteredPacientes[index].pacAviso3.toString()}'),
                    Text(
                        'Aviso 4           ${filteredPacientes[index].pacAviso4.toString()}'),
                    Text(
                        'Aviso 5           ${filteredPacientes[index].pacAviso5.toString()}'),
                    Text(
                        'Aviso 6           ${filteredPacientes[index].pacAviso6.toString()}'),
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
*/