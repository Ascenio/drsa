import 'dart:math';

import 'package:rsa/rsa.dart';

void main() {
  final random = Random(4269);
  print(generatePrimeNumber(random));
}
