import 'dart:developer';

import 'package:encrypt/encrypt.dart' as encrypt;

class MyEncryptionDecryption {
  //For AES Encryption/Decryption
  static final key = encrypt.Key.fromLength(32);
  static final iv = encrypt.IV.fromLength(16);
  static final encrypter = encrypt.Encrypter(encrypt.AES(key));

  static encryptAES(text) {
    final encrypted = encrypter.encrypt(text, iv: iv);

    log(encrypted.toString());
    log(encrypted.bytes.toString());
    log(encrypted.base16.toString());
    log(encrypted.base64.toString());
    return encrypted;
  }

  static decryptAES(text) {
    final decrypted = encrypter.decrypt(text, iv: iv);
    log(decrypted.toString());
    return decrypted;
  }

  // For Fernet Encryption/Decryption
  static final keyFernet =
      encrypt.Key.fromUtf8('TechWithVPIsBestTechWithVPIsBest');
  // if you need to use the ttl feature, you'll need to use APIs in the algorithm itself
  static final fernet = encrypt.Fernet(keyFernet);
  static final encrypterFernet = encrypt.Encrypter(fernet);

  static encryptFernet(text) {
    log('aqui');
    final encrypted = encrypterFernet.encrypt(text);
    log(encrypted.toString());
    log(encrypted.base64.toString());
    log(fernet.extractTimestamp(encrypted.bytes).toString()); // unix timestamp
    return encrypted;
  }

  static decryptFernet(text) {
    return encrypterFernet.decrypt(text);
  }

  // For Salsa20 Encryption/Decryption
  static final keySalsa20 = encrypt.Key.fromLength(32);
  static final ivSalsa20 = encrypt.IV.fromLength(8);
  static final encrypteSalsa20 = encrypt.Encrypter(encrypt.Salsa20(keySalsa20));

  static encryptSalsa20(text) {
    final encrypted = encrypteSalsa20.encrypt(text, iv: ivSalsa20);
    log('aqui1');
    log(encrypted.bytes.toString());
    log(encrypted.base16.toString());
    log(encrypted.base64.toString());
    return encrypted;
  }

  static decryptSalsa20(text) {
    return encrypteSalsa20.decrypt(text, iv: ivSalsa20);
  }
}



/*
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
*/