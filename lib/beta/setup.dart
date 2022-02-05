import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:toggle_switch/toggle_switch.dart';

int colunas = 0;
late Color screenPickerColor;
late Color dialogPickerColor;
late Color dialogSelectColor;
Color pickerColor = const Color(0xff443a49);
Color currentColor = const Color(0xff443a49);
Color cor = Colors.white;
Color corDaManha = Colors.white;
Color corDaTarde = Colors.white;
Color corDaNoite = Colors.white;
Color corDaMadrugada = Colors.white;
Color corDoMarker = Colors.white;
Color corSelected = Colors.white;
Color corHoje = Colors.white;
int value = 0;

class Setup extends StatefulWidget {
  const Setup({Key? key}) : super(key: key);

  @override
  _SetupState createState() => _SetupState();
}

final box = GetStorage();

class _SetupState extends State<Setup> {
  @override
  void initState() {
//    log('entrou');
    if (box.read('colunas') == null) {
      box.write('colunas', 2);
//      log('Colunas 2 Vazio');
    }
    if (box.read('corDaManha') == null) {
      box.write('corDaManha', corDaTarde.toString());
//      log('Cor 1 Vazio');
    }
    if (box.read('corDaTarde') == null) {
      box.write('corDaTarde', corDaTarde.toString());
//      log('Cor 2 Vazio');
    }
    if (box.read('corDaNoite') == null) {
      box.write('corDaNoite', corDaNoite.toString());
//      log('Cor 3 Vazio');
    }
    if (box.read('corDaMadrugada') == null) {
      box.write('corDaMadrugada', corDaMadrugada.toString());
//      log('Cor corDaMadrugada Vazio');
    }
    if (box.read('corDoMarker') == null) {
      box.write('corDoMarker', corDoMarker.toString());
//      log('Cor Marker Vazio');
    }
    if (box.read('corSelected') == null) {
      box.write('corSelected', corSelected.toString());
//      log('Cor Selected Vazio');
    }
    if (box.read('corHoje') == null) {
      box.write('corHoje', corSelected.toString());
//      log('Cor Hoje Vazio');
    }

    corDaManha = lerCor('corDaManha');
    corDaTarde = lerCor('corDaTarde');
    corDaNoite = lerCor('corDaNoite');
    corDaMadrugada = lerCor('corDaMadrugada');
    corDoMarker = lerCor('corDoMarker');
    corSelected = lerCor('corSelected');
    corHoje = lerCor('corHoje');

    colunas = box.read('colunas');
//    log('Colunas Setup2 $colunas');
    setState(() {
      colunas = box.read('colunas');
    });
    screenPickerColor = Colors.blue; // Material blue.
    dialogPickerColor = Colors.red; // Material red.
    dialogSelectColor = const Color(0xFFA239CA); // A purple color
    super.initState();
  }

// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  List<String> itens = [
    'Tema Claro/Escuro',
    'Cores da Agenda (Manhã) (Tarde) (Noite) (Madrugada)',
  ];
  List<FaIcon> itens2 = [
    const FaIcon(FontAwesomeIcons.lightbulb, size: 27, color: Colors.teal),
    const FaIcon(FontAwesomeIcons.search, size: 20),
  ];

  @override
  Widget build(BuildContext context) {
    colunas = box.read('colunas');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuração'),
        centerTitle: true,
        backgroundColor: const Color(0xFF48426D),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 15),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 3,
              ),
              elevation: 0,
              color: const Color(0xFFD6D6D6),
              child: ListTile(
                title: const Text('Tema Claro/Escuro'),
                trailing: GestureDetector(
                  onTap: () {
                    tema();
                  },
                  child: Container(
                    width: 150,
                    height: 30,
                    margin: const EdgeInsets.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        FaIcon(FontAwesomeIcons.lightbulb,
                            size: 27, color: Colors.teal),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 3,
              ),
              elevation: 0,
              color: const Color(0xFFD6D6D6),
              child: ListTile(
                title: const Text('Numero de Colunas nas Fotos do Histórico'),
                trailing: GestureDetector(
                  onTap: () {
//                    tema();
                  },
                  child: Container(
                    width: 150,
                    height: 30,
                    margin: const EdgeInsets.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [fotosPorColuna(colunas)],
                    ),
                  ),
                ),
              ),
            ),
            // Cores da Agenda
            Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 3,
              ),
              elevation: 0,
              color: const Color(0xFFD6D6D6),
              child: ListTile(
                title: const Text('Cor Agenda Manhã/Tarde/Noite/Madrugada'),
                trailing: Container(
                  width: 130,
                  height: 30,
                  margin: const EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          _showAddEventDialog(1);
                        },
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: corDaManha,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _showAddEventDialog(2);
                        },
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: corDaTarde,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _showAddEventDialog(3);
                        },
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: corDaNoite,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _showAddEventDialog(4);
                        },
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: corDaMadrugada,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 3,
              ),
              elevation: 0,
              color: const Color(0xFFD6D6D6),
              child: ListTile(
                title: const Text('Cor Agenda\nMaker/Hoje/Selecionado'),
                trailing: Container(
                  width: 130,
                  height: 30,
                  margin: const EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          _showAddEventDialog(5);
                        },
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: corDoMarker,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _showAddEventDialog(6);
                        },
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: corHoje,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _showAddEventDialog(7);
                        },
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: corSelected,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD6D6D6),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  fotosPorColuna(inicial) {
    return ToggleSwitch(
      minWidth: 35.0,
      minHeight: 90.0,
      fontSize: 16.0,
      initialLabelIndex: inicial - 1,
      activeBgColor: const [Colors.blue],
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.grey[900],
      totalSwitches: 4,
      labels: const ['1', '2', '3', '4'],
      onToggle: (index) {
        index = index! + 1;
        setState(() {
          box.write('colunas', index);
//          log('Gravado Colunas Setup2 $index');
        });
      },
    );
  }

  tema() {
    // ignore: avoid_print
    print('tema 2');
//    ThemeService().switchTheme();
  }

  _showAddEventDialog(int tipo) async {
    log(tipo.toString());
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          /*
          child: BlockPicker(
            useInShowDialog: true,
            pickerColor: currentColor,
            onColorChanged: changeColor,
          ),
*/
          child: MaterialPicker(
            pickerColor: pickerColor,
            onColorChanged: changeColor,
          ),

/*
       child: MultipleChoiceBlockPicker(
         pickerColors: currentColors,
         onColorsChanged: changeColors,
       ),
*/
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('OK'),
            onPressed: () {
              setState(
                () => {
                  currentColor = pickerColor,
                  if (tipo == 1)
                    {
                      corDaManha = currentColor,
                      box.write('corDaManha', currentColor.toString()),
//                      log('1'),
                    }
                  else if (tipo == 2)
                    {
                      corDaTarde = currentColor,
                      box.write('corDaTarde', currentColor.toString()),
                    }
                  else if (tipo == 3)
                    {
                      corDaNoite = currentColor,
                      box.write('corDaNoite', currentColor.toString()),
                    }
                  else if (tipo == 4)
                    {
                      corDaMadrugada = currentColor,
                      box.write('corDaMadrugada', currentColor.toString()),
                    }
                  else if (tipo == 5)
                    {
                      corDoMarker = currentColor,
                      box.write('corDoMarker', currentColor.toString()),
                    }
                  else if (tipo == 6)
                    {
                      corHoje = currentColor,
                      box.write('corHoje', currentColor.toString()),
                    }
                  else if (tipo == 7)
                    {
                      corSelected = currentColor,
                      box.write('corSelected', currentColor.toString()),
                    }
                },
              );
              log(currentColor.toString());
//              log('Picked ${pickerColor.toString()}');

              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  lerCor(String valor) {
    String cor = box.read(valor);
    String valueString = cor.split('(0x')[1].split(')')[0]; // kind of hacky..
    value = int.parse(valueString, radix: 16);
    return Color(value); //.withOpacity(1);
  }
}
