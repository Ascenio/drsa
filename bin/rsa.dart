import 'package:rsa/rsa.dart';

void main() {
  for (var i = 0; i < 300; i++) {
    if (isPrime(i)) {
      print(i);
    }
  }
}
