# :closed_lock_with_key: drsa

An implementation of [RSA](https://en.wikipedia.org/wiki/RSA_(cryptosystem)) algorithm in Dart :bird:

## Usage

### With a seed

To create reproducible keypairs you just need to provide a `Random` created from a seed.

```dart
void main() {
  final random = Random(4269);
  final keyPair = KeyPair.create(random);
  final input = 'Hello World';
  final encrypted = keyPair.privateKey.apply(input.codeUnits);
  final decrypted = keyPair.publicKey.apply(encrypted);
  final output = String.fromCharCodes(decrypted);
  print(output); // Hello World
}
```

### Without a seed

If you don't want a specific keypair, you may want to use a more secure one-time generated keypair.
Just use the secure constructor of `Random`. The rest keeps the same as above.

```dart
void main() {
  final random = Random.secure();
  // ...
}
```
