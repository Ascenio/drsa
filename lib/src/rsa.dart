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
