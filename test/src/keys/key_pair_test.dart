import 'dart:math';

import 'package:rsa/rsa.dart';
import 'package:test/test.dart';

void main() {
  test('creates keys that are inverse of each other', () async {
    final random = Random(4269);
    final keyPair = KeyPair.create(random);
    const input = 'Hello World';
    final encrypted = keyPair.privateKey.apply(input.codeUnits);
    final decrypted = keyPair.publicKey.apply(encrypted);
    final output = String.fromCharCodes(decrypted);
    expect(output, input);
  });
}
