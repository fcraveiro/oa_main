import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oa_fone/oa_fone.dart';

class Paciente extends StatefulWidget {
  const Paciente(
      {Key? key, required this.filteredPacientes, required this.indexa})
      : super(key: key);

  final List filteredPacientes;
  final int indexa;

  @override
  State<Paciente> createState() => _PacienteState();
}

List xfilteredPacientes = [];
int index = 0;

class _PacienteState extends State<Paciente> {
  @override
  void initState() {
//    log(widget.xfilteredPacientes.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    xfilteredPacientes = widget.filteredPacientes;
//    log('INDEX = ${widget.index.toString()}');
    index = widget.indexa;

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
            xfilteredPacientes[index].pacFavorito
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
                    xfilteredPacientes[index].pacFone,
                    xfilteredPacientes[index].pacCel,
                    xfilteredPacientes[index].pacZap1,
                    xfilteredPacientes[index].pacZap2,
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
                    xfilteredPacientes[index].pacNome.toString(),
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
                    xfilteredPacientes[index].pacFone.toString(),
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
                        'UuID               ${xfilteredPacientes[index].pacUuId.toString()}'),
                    Text(
                        'Dentista         ${xfilteredPacientes[index].pacDentista.toString()}'),
                    Text(
                        'Nome             ${xfilteredPacientes[index].pacNome.toString()}'),
                    Text(
                        'Endereço       ${xfilteredPacientes[index].pacEnde.toString()}'),
                    Text(
                        'Cidade           ${xfilteredPacientes[index].pacCity.toString()}'),
                    Text(
                        'Estado           ${xfilteredPacientes[index].pacEst.toString()}'),
                    Text(
                        'Cep                ${xfilteredPacientes[index].pacCep.toString()}'),
                    Text(
                        'Fone              ${xfilteredPacientes[index].pacFone.toString()}'),
                    Text(
                        'Celular           ${xfilteredPacientes[index].pacCel.toString()}'),
                    Text(
                        'Zap1               ${xfilteredPacientes[index].pacZap1.toString()}'),
                    Text(
                        'Zap2               ${xfilteredPacientes[index].pacZap2.toString()}'),
                    Text(
                        'Favorito          ${xfilteredPacientes[index].pacFavorito.toString()}'),
                    Text(
                        'Tratando        ${xfilteredPacientes[index].pacTratando.toString()}'),
                    Text(
                        'Remarcado    ${xfilteredPacientes[index].pacRemarcado.toString()}'),
                    Text(
                        'Completo       ${xfilteredPacientes[index].pacCompleto.toString()}'),
                    Text(
                        'Aviso 1           ${xfilteredPacientes[index].pacAviso1.toString()}'),
                    Text(
                        'Aviso 2           ${xfilteredPacientes[index].pacAviso2.toString()}'),
                    Text(
                        'Aviso 3           ${xfilteredPacientes[index].pacAviso3.toString()}'),
                    Text(
                        'Aviso 4           ${xfilteredPacientes[index].pacAviso4.toString()}'),
                    Text(
                        'Aviso 5           ${xfilteredPacientes[index].pacAviso5.toString()}'),
                    Text(
                        'Aviso 6           ${xfilteredPacientes[index].pacAviso6.toString()}'),
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
