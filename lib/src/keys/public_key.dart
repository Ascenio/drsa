import 'package:drsa/src/keys/key.dart';

class PublicKey implements Key {
  const PublicKey({required this.d, required this.n});

  final int d;
  final int n;

  @override
  Iterable<int> apply(Iterable<int> message) {
    return message.map((letter) => letter.modPow(d, n));
  }
}
