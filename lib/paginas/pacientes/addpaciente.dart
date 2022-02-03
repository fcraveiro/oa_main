import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:oa_main/model/pacientes.dart';
import 'package:via_cep_flutter/via_cep_flutter.dart';

class AddPaciente extends StatefulWidget {
  const AddPaciente({Key? key}) : super(key: key);

  @override
  _FormTesteState createState() => _FormTesteState();
}

final formPaciente = ClassPaciente(
  pacUuId: '',
  pacDentista: 0,
  pacNome: '',
  pacEnde: '',
  pacCity: '',
  pacEst: '',
  pacCep: 0,
  pacFone: 0,
  pacCel: 0,
  pacZap1: false,
  pacZap2: false,
  pacFavorito: false,
  pacTratando: false,
  pacRemarcado: false,
  pacCompleto: true,
  pacAviso1: false,
  pacAviso2: false,
  pacAviso3: false,
  pacAviso4: false,
  pacAviso5: false,
  pacAviso6: false,
);

var maskFormatterCep =
    MaskTextInputFormatter(mask: '########', filter: {"#": RegExp(r'[0-9]')});
var maskFormatterFone = MaskTextInputFormatter(mask: "(##) #########");
var maskFormatterEstado = MaskTextInputFormatter(mask: "AA");

class _FormTesteState extends State<AddPaciente> {
  final formKey = GlobalKey<FormState>(); //key for form
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _endeController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _estadoController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _celularController = TextEditingController();
  final TextEditingController _viaController = TextEditingController();

  final box = GetStorage();
  int userDentista = 0;
  var isWhats1 = false;
  var isWhats2 = false;
  var isComplete = false;
  var nomeCerto = false;
  var endeCerto = false;
  var cidadeCerto = false;
  var estadoCerto = false;
  var foneCerto = false;
  var celularCerto = false;
  var cepCerto = false;
  var viaCerto = false;
  var pacFone = '';
  var viaCep = '';
  bool isHeart = false;
  String textoAvulso = 'Completo';

  var focusBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
      width: 1,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(6),
    ),
  );

  var outlineInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.pink,
      width: 1,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(6),
    ),
  );

  var labelStyle = const TextStyle(
    color: Colors.blue,
  );

  var style = const TextStyle(
    fontSize: 14,
    color: Colors.black,
  );

  var contentPadding = const EdgeInsets.symmetric(horizontal: 20, vertical: 0);

  @override
  void initState() {
    super.initState();
    isComplete = true;
    limparCampos();
    userDentista = box.read('dentistaAtual');
    setState(() {});
  }

  void limparCampos() {
    _nomeController.text = '';
    _endeController.text = '';
    _cidadeController.text = '';
    _estadoController.text = '';
    _cepController.text = '';
    _telefoneController.text = '';
    _celularController.text = '';
    _viaController.text = '';
    isWhats1 = false;
    isWhats2 = false;
    isHeart = false;
  }

  void gravarPaciente() async {
    var result = Get.toNamed('/gravapaciente/');

    /*
        await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => GravaPaciente(
          form: formPaciente,
        ),
        fullscreenDialog: true,
      ),
    );
*/

    if (result != null) {
      limparCampos();
      log(result.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 55,
            color: const Color(0xFF48426D),
//            color: Colors.amber,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 0, left: 25, right: 9, bottom: 8),
              child: Container(
                width: 130,
                height: 42,
                margin: const EdgeInsets.only(bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Cadasto de Pacientes ',
                        style: GoogleFonts.nunito(
                            fontSize: 16, color: Colors.grey[300]),
                        children: <TextSpan>[
                          TextSpan(
                            text: textoAvulso,
                            style: GoogleFonts.nunito(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Switch.adaptive(
                      activeColor: Colors.white,
                      inactiveThumbColor: Colors.grey,
                      value: isComplete,
                      onChanged: (value) {
                        setState(
                          () {
                            setState(() {
                              isComplete = !isComplete;
                            });
                            isComplete
                                ? textoAvulso = 'Completo'
                                : textoAvulso = 'Avulso';
                            value;
                            //logvalue.toString());
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(0),
              child: Form(
                key: formKey, //key for form
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: isComplete
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 130,
                                      height: 40,
                                      child: TextFormField(
                                        controller: _viaController,
                                        inputFormatters: [maskFormatterCep],
                                        keyboardType: TextInputType.number,
                                        style: style,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: contentPadding,
                                          labelText: 'Procura Cep',
                                          labelStyle: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.blue,
                                          ),
                                          enabledBorder: outlineInputBorder,
                                          focusedBorder: focusBorder,
                                        ),
                                        onChanged: (value) => {
                                          if (value.isEmpty)
                                            {viaCerto = false}
                                          else
                                            {
                                              viaCerto = true,
                                              viaCep = value,
                                              log(formPaciente.pacCep
                                                  .toString()),
                                            },
                                          setState(() {})
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      width: 50,
                                      height: 30,
                                      margin: const EdgeInsets.only(top: 2),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: const Color(
                                              0xFF48426D), // background
                                          onPrimary: Colors.grey,
                                        ),
                                        onPressed: () {
                                          viacep(viaCep);
                                        },
                                        child: const Icon(
                                          FontAwesomeIcons.search,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    isHeart = !isHeart;
                                    setState(() {});
                                  },
                                  child: Container(
                                    width: 45,
                                    height: 42,
                                    margin: const EdgeInsets.only(bottom: 0),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.pink,
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(6),
                                      ),
                                    ),
                                    child: isHeart
                                        ? const FaIcon(
                                            FontAwesomeIcons.solidHeart,
                                            size: 24,
                                            color: Colors.teal,
                                          )
                                        : const FaIcon(
                                            FontAwesomeIcons.heart,
                                            size: 24,
                                            color: Colors.teal,
                                          ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                formNome(),
                                divisao(),
                                formEnde(),
                                divisao(),
                                formCidade(),
                                divisao(),
                                formEstadoCep(),
                                divisao(),
                                formFoneZap1(),
                                divisao(),
                                formCelularZap2(),
                                _botaoSubmit(),
                              ],
                            )
                          ],
                        )
                      : Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                formNome(),
                                divisao(),
                                formFoneZap1(),
                                divisao(),
                                formCelularZap2(),
                                _botaoSubmit(),
                              ],
                            )
                          ],
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget formNome() {
    return SizedBox(
      height: 42,
      child: TextFormField(
        controller: _nomeController,
        style: style,
        decoration: decoration('Nome', nomeCerto),
        onChanged: (value) => {
          value.isEmpty
              ? nomeCerto = false
              : {
                  formPaciente.pacNome = value,
                  nomeCerto = true,
                },
          setState(() {})
        },
      ),
    );
  }

  Widget formEnde() {
    return SizedBox(
      height: 42,
      child: TextFormField(
        controller: _endeController,
        style: style,
        decoration: decoration('Endereço', endeCerto),
        onChanged: (value) => {
          value.isEmpty
              ? endeCerto = false
              : {
                  formPaciente.pacEnde = value,
                  endeCerto = true,
                },
          setState(() {})
        },
      ),
    );
  }

  Widget formCidade() {
    return SizedBox(
      height: 42,
      child: TextFormField(
        controller: _cidadeController,
        style: style,
        decoration: decoration('Cidade', cidadeCerto),
        onChanged: (value) => {
          value.isEmpty
              ? cidadeCerto = false
              : {
                  formPaciente.pacCity = value,
                  cidadeCerto = true,
                },
          setState(() {})
        },
      ),
    );
  }

  Widget formEstadoCep() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: 150,
          height: 42,
          child: TextFormField(
            controller: _estadoController,
            inputFormatters: [maskFormatterEstado],
            style: style,
            decoration: decoration('Estado', estadoCerto),
            onChanged: (value) => {
              if (value.isEmpty)
                {estadoCerto = false}
              else if (value.length == 2)
                {
                  {
                    estadoCerto = true,
                    formPaciente.pacEst = value.toUpperCase(),
                  }
                }
              else
                {estadoCerto = false},
              setState(() {})
            },
          ),
        ),
        SizedBox(
          width: 160,
          height: 42,
          child: TextFormField(
            controller: _cepController,
            inputFormatters: [maskFormatterCep],
            keyboardType: TextInputType.number,
            style: style,
            decoration: decoration('Cep', cepCerto),
            onChanged: (value) => {
              if (value.isEmpty)
                {cepCerto = false}
              else if (value.length < 8)
                {
                  cepCerto = false,
                }
              else
                {
                  cepCerto = true,
                },
              setState(() {})
            },
          ),
        )
      ],
    );
  }

  Widget formFoneZap1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 42,
//          color: Colors.yellow,
          child: TextFormField(
            controller: _telefoneController,
            inputFormatters: [maskFormatterFone],
            style: style,
            decoration: decoration('Telefone Principal', foneCerto),
            onChanged: (value) => {
              if (value.isEmpty)
                {
                  foneCerto = false,
                  formPaciente.pacFone = 0,
                }
              else if (value.length < 13)
                {
                  foneCerto = false,
                  formPaciente.pacFone = 0,
                }
              else
                {
                  foneCerto = true,
                },
              setState(() {})
            },
          ),
        ),
        foneCerto
            ? Container(
                width: 95,
                height: 42,
                margin: const EdgeInsets.only(bottom: 0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.pink,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Checkbox(
                      value: isWhats1,
                      checkColor: Colors.white,
                      onChanged: (value) {
                        setState(
                          () {
                            if (value != null) isWhats1 = value;
                            value;
                            //logvalue.toString());
                          },
                        );
                      },
                    ),
                    Container(
                      width: 28,
                      height: 28,
                      margin: const EdgeInsets.only(bottom: 0),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          ImageIcon(
                            AssetImage('assets/imagens/whatsapp.png'),
                            size: 18,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              )
            : zap1false(),
      ],
    );
  }

  Widget formCelularZap2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 42,
//          color: Colors.yellow,
          child: TextFormField(
            controller: _celularController,
            inputFormatters: [maskFormatterFone],
            style: style,
            decoration: decoration('Celular', celularCerto),
            onChanged: (value) => {
              if (value.isEmpty)
                {
                  celularCerto = false,
                  formPaciente.pacCel = 0,
                }
              else if (value.length < 13)
                {
                  celularCerto = false,
                  formPaciente.pacCel = 0,
                }
              else
                {
                  celularCerto = true,
                },
              setState(() {})
            },
          ),
        ),
        celularCerto
            ? Container(
                width: 95,
                height: 42,
                margin: const EdgeInsets.only(bottom: 0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.pink,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Checkbox(
                      value: isWhats2,
                      checkColor: Colors.white,
                      onChanged: (value) {
                        setState(
                          () {
                            if (value != null) isWhats2 = value;
                            value;
                            //logvalue.toString());
                          },
                        );
                      },
                    ),
                    Container(
                      width: 28,
                      height: 28,
                      margin: const EdgeInsets.only(bottom: 0),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          ImageIcon(
                            AssetImage('assets/imagens/whatsapp.png'),
                            size: 18,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              )
            : zap2false(),
      ],
    );
  }

  Widget _botaoSubmit() {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
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
          isComplete
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF48426D), // background
                          onPrimary: Colors.white, // foreground
                          fixedSize: const Size(100, 30)),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (nomeCerto &
                              endeCerto &
                              cidadeCerto &
                              estadoCerto &
                              cepCerto) {
                            formPaciente.pacDentista = userDentista;
                            formPaciente.pacNome = _nomeController.text;
                            formPaciente.pacEnde = _endeController.text;
                            formPaciente.pacCity = _cidadeController.text;
                            formPaciente.pacEst = _estadoController.text;
                            formPaciente.pacCep =
                                int.parse(_cepController.text);
                            formPaciente.pacZap1 = isWhats1;
                            formPaciente.pacZap2 = isWhats2;
                            formPaciente.pacFavorito = isHeart;
                            formPaciente.pacCompleto = isComplete;
                            formPaciente.pacTratando = false;
                            formPaciente.pacRemarcado = false;
                            formPaciente.pacAviso1 = false;
                            formPaciente.pacAviso2 = false;
                            formPaciente.pacAviso3 = false;
                            formPaciente.pacAviso4 = false;
                            formPaciente.pacAviso5 = false;
                            formPaciente.pacAviso6 = false;
                            if (foneCerto) {
                              pacFone = _telefoneController.text
                                  .replaceAll(RegExp('[^A-Za-z0-9]'), '');
                              formPaciente.pacFone = int.parse(pacFone);
                            }
                            if (celularCerto) {
                              pacFone = _celularController.text
                                  .replaceAll(RegExp('[^A-Za-z0-9]'), '');
                              formPaciente.pacCel = int.parse(pacFone);
                            }

                            log('Dentista ${formPaciente.pacDentista}');
                            log('Completo ${formPaciente.pacCompleto}');
                            log('Nome ${formPaciente.pacNome}');
                            log('Endereco ${formPaciente.pacEnde}');
                            log('Cidade ${formPaciente.pacCity}');
                            log('Estado ${formPaciente.pacEst}');
                            log('Cep ${formPaciente.pacCep}');
                            log('Telefone ${formPaciente.pacFone}');
                            log('Celular ${formPaciente.pacCel}');
                            log('WhatsApp 1 ${formPaciente.pacZap1}');
                            log('WhatsApp 2 ${formPaciente.pacZap2}');
                            log('Favorito ${formPaciente.pacFavorito}');
                            log('Tratanto ${formPaciente.pacTratando}');
                            log('Remarcado ${formPaciente.pacRemarcado}');
                            log('Aviso 1 ${formPaciente.pacAviso1}');
                            log('Aviso 2 ${formPaciente.pacAviso2}');
                            log('Aviso 3 ${formPaciente.pacAviso3}');
                            log('Aviso 4 ${formPaciente.pacAviso4}');
                            log('Aviso 5 ${formPaciente.pacAviso5}');
                            log('Aviso 6  ${formPaciente.pacAviso6}');
                          }

                          gravarPaciente();
//                           gravarPaciente(context, formPaciente);
                        }
                      },
                      child: Text(
                        'Enviar',
                        style: GoogleFonts.nunito(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors
                              .blue, // const Color(0xFF48426D), // background
                          onPrimary: Colors.white, // foreground
                          fixedSize: const Size(100, 30)),
                      onPressed: () {
                        if (nomeCerto) {
                          formPaciente.pacDentista = userDentista;
                          formPaciente.pacNome = _nomeController.text;
                          formPaciente.pacZap1 = isWhats1;
                          formPaciente.pacZap2 = isWhats2;
                          formPaciente.pacEnde = 'np';
                          formPaciente.pacCity = 'np';
                          formPaciente.pacEst = 'np';
                          formPaciente.pacCep = 0;

                          if (endeCerto) {
                            formPaciente.pacEnde = _endeController.text;
                          }
                          if (cidadeCerto) {
                            formPaciente.pacCity = _cidadeController.text;
                          }
                          if (estadoCerto) {
                            formPaciente.pacEst = _estadoController.text;
                          }
                          if (cepCerto) {
                            formPaciente.pacCep =
                                int.parse(_cepController.text);
                          }

                          formPaciente.pacFavorito = isHeart;
                          formPaciente.pacCompleto = false;
                          formPaciente.pacTratando = false;
                          formPaciente.pacRemarcado = false;
                          formPaciente.pacAviso1 = false;
                          formPaciente.pacAviso2 = false;
                          formPaciente.pacAviso3 = false;
                          formPaciente.pacAviso4 = false;
                          formPaciente.pacAviso5 = false;
                          formPaciente.pacAviso6 = false;
                          if (foneCerto) {
                            pacFone = _telefoneController.text
                                .replaceAll(RegExp('[^A-Za-z0-9]'), '');
                            formPaciente.pacFone = int.parse(pacFone);
                          }
                          if (celularCerto) {
                            pacFone = _celularController.text
                                .replaceAll(RegExp('[^A-Za-z0-9]'), '');
                            formPaciente.pacCel = int.parse(pacFone);
                          }

                          log('Dentista ${formPaciente.pacDentista}');
                          log('Completo ${formPaciente.pacCompleto}');
                          log('Nome ${formPaciente.pacNome}');
                          log('Endereco ${formPaciente.pacEnde}');
                          log('Cidade ${formPaciente.pacCity}');
                          log('Estado ${formPaciente.pacEst}');
                          log('Cep ${formPaciente.pacCep}');
                          log('Telefone ${formPaciente.pacFone}');
                          log('Celular ${formPaciente.pacCel}');
                          log('WhatsApp 1 ${formPaciente.pacZap1}');
                          log('WhatsApp 2 ${formPaciente.pacZap2}');
                          log('Favorito ${formPaciente.pacFavorito}');
                          log('Tratanto ${formPaciente.pacTratando}');
                          log('Remarcado ${formPaciente.pacRemarcado}');
                          log('Aviso 1 ${formPaciente.pacAviso1}');
                          log('Aviso 2 ${formPaciente.pacAviso2}');
                          log('Aviso 3 ${formPaciente.pacAviso3}');
                          log('Aviso 4 ${formPaciente.pacAviso4}');
                          log('Aviso 5 ${formPaciente.pacAviso5}');
                          log('Aviso 6 ${formPaciente.pacAviso6}');
                        }

                        gravarPaciente();
                        // gravarPaciente(context, formPaciente);
                      },
                      child: Text(
                        'Enviar',
                        style: GoogleFonts.nunito(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  zap1false() {
    isWhats1 = false;
    setState(() {});
    return const Text('');
  }

  zap2false() {
    isWhats2 = false;
    setState(() {});
    return const Text('');
  }

  divisao() {
    return const SizedBox(
      height: 18,
    );
  }

  viacep(String cep) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        elevation: 10,
        backgroundColor: Color(0xFF48426D),
        content: Text(
          'Aguarde : Procurando Cep !!',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
    final result = await readAddressByCep(cep);
    setState(
      () {
        if (result.isEmpty) {
          _endeController.text = '';
          _cidadeController.text = '';
          _estadoController.text = '';
          _cepController.text = '';
          //logformPaciente.toString());
        } else {
          _endeController.text = result['street'];
          endeCerto = true;
          _cidadeController.text = result['city'];
          cidadeCerto = true;
          _estadoController.text = result['state'];
          estadoCerto = true;
          _cepController.text = result['cep'];
          cepCerto = true;
          setState(() {});
          //logformPaciente.toString());
        }
      },
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  decoration(texto, iconeCerto) {
    return InputDecoration(
      border: InputBorder.none,
      contentPadding: contentPadding,
      labelText: texto,
      labelStyle: labelStyle,
      enabledBorder: outlineInputBorder,
      focusedBorder: focusBorder,
      suffixIcon: iconeCerto
          ? const Icon(
              FontAwesomeIcons.thumbsUp,
              color: Colors.green,
              size: 20,
            )
          : Icon(
              FontAwesomeIcons.times,
              color: Colors.red.shade300,
              size: 20,
            ),
    );
  }
}


/*  

gravarPaciente3(context, form) {
  Get.toNamed('/gravapaciente/', arguments: form);
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => GravaPaciente(
        form: form,
      ),
    ),
  );
}
*/
