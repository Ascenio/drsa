import 'package:rsa/src/keys/key.dart';

class PrivateKey implements Key {
  const PrivateKey({required this.e, required this.n});

  final int e;
  final int n;

  @override
  Iterable<int> apply(Iterable<int> message) {
    return message.map((letter) => letter.modPow(e, n));
  }
}
