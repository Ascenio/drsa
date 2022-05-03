import 'dart:math';

import 'package:drsa/drsa.dart';

class KeyPair {
  const KeyPair({required this.privateKey, required this.publicKey});

  factory KeyPair.create(Random random) {
    final p = generatePrimeNumber(random);
    final q = generatePrimeNumber(random);
    final n = p * q;
    final phi = (p - 1) * (q - 1);
    final e = pickE(phi: phi);
    final d = pickD(phi: phi, e: e);
    final privateKey = PrivateKey(e: e, n: n);
    final publicKey = PublicKey(d: d, n: n);
    return KeyPair(
      privateKey: privateKey,
      publicKey: publicKey,
    );
  }

  final Key privateKey;
  final Key publicKey;
}
