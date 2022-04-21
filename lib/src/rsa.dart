import 'dart:math';

bool isPrime(int number) {
  if (number < 2) {
    return false;
  }
  if (number == 2) {
    return true;
  }
  if (number.isEven) {
    return false;
  }
  int n = sqrt(number).floor();
  for (var i = 3; i <= n; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}

int generatePrimeNumber(Random random, [int upperBound = 1000]) {
  while (true) {
    final number = random.nextInt(upperBound);
    if (isPrime(number)) {
      return number;
    }
  }
}

bool areCoprimes(int a, int b) {
  return a.gcd(b) == 1;
}

int pickE({required int phi, required int n}) {
  for (int e = 2; e < phi; e++) {
    final isCoprimeWithPhi = areCoprimes(e, phi);
    if (isCoprimeWithPhi) {
      return e;
    }
  }
  throw StateError('Couldn\' find "e" for $phi');
}

int pickD({required int e, required int phi}) {
  for (var d = 1;; d++) {
    if ((d * e) % phi == 1) {
      return d;
    }
  }
}

Iterable<int> encrypt({
  required Iterable<int> message,
  required int e,
  required int n,
}) {
  return message.map((letter) => letter.modPow(e, n));
}

Iterable<int> decrypt({
  required Iterable<int> message,
  required int d,
  required int n,
}) {
  return message.map((letter) => letter.modPow(d, n));
}
