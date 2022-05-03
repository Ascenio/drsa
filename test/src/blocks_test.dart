import 'package:drsa/drsa.dart';
import 'package:test/test.dart';

void main() {
  group('addPadding', () {
    test('is a no-op for aligned messages', () {
      final message = 'This message is aligned.';
      final messageWithPadding = addPadding(message: message);
      expect(messageWithPadding, message);
    });

    test('adds padding for not aligned messages', () {
      final message = 'This message is not aligned.';
      const expectedMessage = 'This message is not aligned.    ';
      final messageWithPadding = addPadding(message: message);
      expect(messageWithPadding, expectedMessage);
    });
  });

  group('messageIntoBlocks', () {
    test('can only be called with aligned messages', () {
      final nonAlignedMessage = 'This message is not aligned.';
      expect(
        () => messageIntoBlocks(message: nonAlignedMessage),
        throwsArgumentError,
      );
    });

    test('converts into blocks properly', () {
      final message = 'ABCDEFGH';
      const expectedBlocks = [5208208757389214273];
      final blocks = messageIntoBlocks(message: message);
      expect(blocks, orderedEquals(expectedBlocks));
    });
  });

  group('blocksIntoMessage', () {
    test('converts into message properly', () {
      final blocks = [5208208757389214273];
      const expectedMessage = 'ABCDEFGH';
      final message = blocksIntoMessage(blocks: blocks);
      expect(message, expectedMessage);
    });
  });
}
