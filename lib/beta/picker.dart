import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:supabase/supabase.dart';
import 'package:lottie/lottie.dart';
import '/services/config.dart';
import 'dart:math';
import 'dart:io';

class Picker extends StatefulWidget {
  const Picker({Key? key}) : super(key: key);

  @override
  _PickerState createState() => _PickerState();
}

File pathFoto = '' as File;
File pathThumbs = '' as File;
bool mudou = false;
bool temFoto = false;
bool foiSalva = false;

var tipoArquivo = '.jpg';
var idFoto = '';
var idThumb = '';
var animacao = '';
int escolha = 0;

var pathServerNormal = '';
var pathServerThumb = '';

class _PickerState extends State<Picker> {
  SupabaseClient cliente = SupabaseClient(supabaseUrl, supabaseKey);

  @override
  void initState() {
    super.initState();
    animaQuadro();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capturar Imagem'),
        centerTitle: true,
        backgroundColor: const Color(0xFF48426D),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 10,
          height: MediaQuery.of(context).size.height - 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 280,
                height: 365,
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.only(top: 45),
                child: temFoto
                    ? Image.file(File(pathFoto.path))
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LottieBuilder.asset('assets/imagens/$animacao'),
                        ],
                      ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  temFoto
                      ? SizedBox(
                          width: 130,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              gravacao();
                              setState(() {
                                temFoto = false;
                              });
                              _showToast(context);
                            },
                            child: texto('SalvarI'),
                          ),
                        )
                      : const SizedBox(
                          width: 130,
                          height: 40,
                        ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              temFoto
                  ? const Text(
                      ' ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : const Text(
                      'Aguardando sua Opção',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 130,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        foiSalva = false;
                        pickCamera();
                      },
                      child: texto('Câmera'),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    width: 130,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        foiSalva = false;
                        pickgaleria();
                      },
                      child: texto('Galeria'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  texto(String texto) {
    return SizedBox(
      width: 160,
      child: Text(
        texto,
        textAlign: TextAlign.center,
      ),
    );
  }

  Future<XFile?> getPicker(int tipo) async {
    final ImagePicker _picker = ImagePicker();
    if (tipo == 1) {
      final image = await _picker.pickImage(
        source: ImageSource.camera,
      );
      return image;
    } else {
      final image = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      return image;
    }
  }

  pickCamera() async {
    XFile? file = await getPicker(1);
    if (file != null) {
      pathFoto = File(file.path);
      setState(() {
        temFoto = true;
      });
    }
  }

  pickgaleria() async {
    XFile? file = await getPicker(2);
    if (file != null) {
      pathFoto = File(file.path);
      setState(() {
        temFoto = true;
      });
    }
  }

  gravaFoto(int tipo, String nomeDaFoto, File pathFoto) async {
    await cliente.storage.from('pronto').upload(nomeDaFoto, pathFoto).then(
      (value) {
        var response = cliente.storage.from('pronto').getPublicUrl(nomeDaFoto);
        if (tipo == 1) {
          pathServerNormal = response.data.toString();
          // ignore: avoid_print
          print('Path Servidor Normal : $pathServerNormal');
        } else {
          pathServerThumb = response.data.toString();
          // ignore: avoid_print
          print('Path Servidor Thumb : $pathServerThumb');
        }
      },
    );
  }

  geraThumb(int tipo, File foto) async {
    /*
    File response = await FlutterNativeImage.compressImage(foto.path,
        quality: 80, targetWidth: 200, targetHeight: 355);
    pathThumbs = File(response.path);
    return pathThumbs;
*/

    File response = await FlutterNativeImage.compressImage(
      foto.path,
      quality: 65,
      percentage: 25,
    );
    pathThumbs = File(response.path);
    return pathThumbs;
  }

  gravacao() async {
    var dnow = DateTime.now();
    var formatter = DateFormat('yyyy.MM.dd.hh.mm.ss');
    var dataHoje = formatter.format(dnow);
    idFoto = dataHoje + tipoArquivo;
    await gravaFoto(1, idFoto, pathFoto);
    await geraThumb(1, pathFoto);
    idThumb = dataHoje + '-thumb' + tipoArquivo;
    await gravaFoto(2, idThumb, pathThumbs);
    animaQuadro();
    await gravaPaciente(pathServerThumb);
    // ignore: avoid_print
    print(pathServerNormal);
    // ignore: avoid_print
    print(pathServerNormal);
    foiSalva = true;
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      const SnackBar(
        elevation: 10,
        duration: Duration(seconds: 2),
        content: Text(
          'Salvando a Imagem !!',
          style: TextStyle(
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  animaQuadro() {
    int max = 17;
    int escolha = Random().nextInt(max) + 1;
    animacao = '$escolha.json';
    // ignore: avoid_print
    print('Escolha $escolha');
    // ignore: avoid_print
    print('Escolha $animacao');
  }

  Future gravaPaciente(String pathThumbs) async {
    await cliente.from('historico').insert(
      {
        'hisIdPaciente': 1,
        'hisPathThumb': pathThumbs,
        'hisPathServer': pathServerNormal,
        'hisFoto': true
      },
    ).execute();
  }
}
