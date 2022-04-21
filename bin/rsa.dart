import 'dart:math';

import 'package:rsa/rsa.dart';

void main() {
  final random = Random(4269);
  final keyPair = KeyPair.create(random);
  final input = 'Hello World';
  final encrypted = keyPair.privateKey.apply(input.codeUnits);
  final decrypted = keyPair.publicKey.apply(encrypted);
  final output = String.fromCharCodes(decrypted);
  print(output);
}
