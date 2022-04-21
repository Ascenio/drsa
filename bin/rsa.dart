import 'dart:math';

import 'package:rsa/rsa.dart';
import 'package:rsa/src/keys/private_key.dart';
import 'package:rsa/src/keys/public_key.dart';

void main() {
  final random = Random(4269);
  final p = generatePrimeNumber(random);
  final q = generatePrimeNumber(random);
  final n = p * q;
  final phi = (p - 1) * (q - 1);
  final e = pickE(phi: phi, n: n);
  final d = pickD(phi: phi, e: e);
  final input = 'Hello World';
  final privateKey = PrivateKey(e: e, n: n);
  final publicKey = PublicKey(d: d, n: n);
  final encrypted = privateKey.apply(input.codeUnits);
  final decrypted = publicKey.apply(encrypted);
  final output = String.fromCharCodes(decrypted);
  print(output);
}
