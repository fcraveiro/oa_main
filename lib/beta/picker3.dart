import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oa_main/services/config.cfg';
import 'package:supabase/supabase.dart';

class Picker3 extends StatefulWidget {
  const Picker3({Key? key}) : super(key: key);

  @override
  _Picker3State createState() => _Picker3State();
}

var idFoto = '';
File pathFoto = '' as File;
File pathThumbs = '' as File;

class _Picker3State extends State<Picker3> {
  SupabaseClient cliente = SupabaseClient(supabaseUrl, supabaseKey);

  XFile? _image;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crop Profile'),
        centerTitle: true,
        backgroundColor: const Color(0xFF48426D),
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () => {},
                child: const Icon(Icons.add_a_photo),
              ),
              const SizedBox(
                width: 17,
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              _showSelectImageDialog();
            },
            child: Container(
              height: screenWidth,
              width: screenWidth,
              color: Colors.grey[300],
              child: _image == null
                  ? const Icon(
                      Icons.add_a_photo,
                      color: Colors.white70,
                      size: 150,
                    )
                  : Image(
                      image: FileImage(
                        File(_image!.path),
                      ),
                      fit: BoxFit.contain,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSelectImageDialog() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text('Add Photo'),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: const Text('Take Photo'),
              onPressed: () => _handleImage(source: ImageSource.camera),
            ),
            CupertinoActionSheetAction(
              child: const Text('Choose From Gallery'),
              onPressed: () => _handleImage(source: ImageSource.gallery),
            )
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.redAccent),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        );
      },
    );
  }

  void _handleImage({required ImageSource source}) async {
    Navigator.pop(context);
    XFile? imageFile = await ImagePicker().pickImage(source: source);
    pathFoto = File(imageFile!.path);
    gravaFoto(pathFoto);
    imageFile = await _cropImage(imageFile: imageFile);
    setState(() {
      _image = imageFile;
    });

    log('foto ${File(_image!.path)}');
  }

  Future<XFile?> _cropImage({required XFile imageFile}) async {
    File? croppedImage = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        compressFormat: ImageCompressFormat.png,
        compressQuality: 50,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
//          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
//          CropAspectRatioPreset.ratio4x3,
//          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Recortar Foto',
            toolbarColor: const Color(0xFF48426D),
            toolbarWidgetColor: const Color(0xFFFFFFFF),
            statusBarColor: const Color(0xFF48426D),
            cropGridColor: const Color(0xFFFFC107),
            cropFrameColor: const Color(0xFFFFEB3B),
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            dimmedLayerColor:
                const Color.fromARGB(122, 0, 0, 0).withOpacity(.5),
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: const IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));

    if (croppedImage == null) {
      return null;
    }
    log(croppedImage.path.toString());
    return XFile(croppedImage.path);
  }

  gravaFoto(File pathFoto) async {
    DateTime now = DateTime.now();
    idFoto = now.toString() + '.jpg';
    var nomeDaFoto = 'nomedafoto.jpg';
    log('Gravar : $pathFoto');
    await cliente.storage.from('fotos').upload(nomeDaFoto, pathFoto).then(
      (value) {
        var response = cliente.storage.from('fotos').getPublicUrl(nomeDaFoto);
        var pathServer = response.data.toString();
        // ignore: avoid_print
        log('Path Servidor : $pathServer');
      },
    );
  }
}
