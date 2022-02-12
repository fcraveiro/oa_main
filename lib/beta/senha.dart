import 'dart:developer';

import 'package:encrypt/encrypt.dart';

void senha() {
  const plainText = 'Carlos Fernando';

  final key = Key.fromSecureRandom(32);
  final iv = IV.fromSecureRandom(16);
  final encrypter = Encrypter(AES(key));
  log('1o ${encrypter.toString()}');

  final encrypted = encrypter.encrypt(plainText, iv: iv);
  log('2o ${encrypted.toString()}');
  final teste = encrypted;
  final decrypted = encrypter.decrypt(teste, iv: iv);
  log('3o ${decrypted.toString()}');

//  log(decrypted);
//  log(encrypted.bytes.toString());
//  log(encrypted.base16);
//  log(encrypted.base64);
}
