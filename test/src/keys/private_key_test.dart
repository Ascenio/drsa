import 'package:drsa/drsa.dart';
import 'package:test/test.dart';

void main() {
  test('guarantees the output is different than the input', () {
    final input = 'Hello World';
    final privateKey = PrivateKey(e: 5, n: 394391);
    final output = privateKey.apply(input.codeUnits);
    expect(input.codeUnits, isNot(orderedEquals(output)));
  });
}
