import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Picker3 extends StatefulWidget {
  const Picker3({Key? key}) : super(key: key);

  @override
  _Picker3State createState() => _Picker3State();
}

class _Picker3State extends State<Picker3> {
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

    if (imageFile != null) {
      imageFile = await _cropImage(imageFile: imageFile);
      setState(() {
        _image = imageFile;
      });
    }
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
        androidUiSettings: const AndroidUiSettings(
            toolbarTitle: 'Recortar Foto',
            toolbarColor: Color(0xFF48426D),
            toolbarWidgetColor: Colors.white,
            statusBarColor: Color(0xFF48426D),
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
}
