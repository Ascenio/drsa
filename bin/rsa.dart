import 'dart:math';

import 'package:rsa/rsa.dart';

void main() {
  final random = Random(4269);
  final p = generatePrimeNumber(random);
  final q = generatePrimeNumber(random);
  final n = p * q;
  final phi = (p - 1) * (q - 1);
  final e = pickE(phi: phi, n: n);
  final d = pickD(phi: phi, e: e);
  final input = 'Hello World';
  final encrypted = encrypt(message: input.codeUnits, e: e, n: n);
  final decrypted = decrypt(message: encrypted, d: d, n: n);
  final output = String.fromCharCodes(decrypted);
  print(output);
}
