Iterable<int> messageIntoBlocks({
  required String message,
  int blockSizeInBytes = 8,
}) sync* {
  if (message.length % blockSizeInBytes != 0) {
    throw ArgumentError.value(message);
  }
  final blocksCount = message.length ~/ blockSizeInBytes;
  for (var i = 0; i < blocksCount; i++) {
    final isLastBlock = i == blocksCount - 1;
    final start = i * blockSizeInBytes;
    final end = isLastBlock ? null : start + blockSizeInBytes;
    final blockString = message.substring(start, end);
    assert(blockString.length == blockSizeInBytes);
    var block = 0;
    for (var i = 0; i < blockString.codeUnits.length; i++) {
      final char = blockString.codeUnits[i] & 0xFF;
      block |= char << (i * 8);
    }
    yield block;
  }
}

String blocksIntoMessage({
  required Iterable<int> blocks,
  int blockSizeInBytes = 8,
}) {
  final buffer = StringBuffer();
  for (final block in blocks) {
    for (var i = 0; i < blockSizeInBytes; i++) {
      final char = 0xFF & (block >> (i * 8));
      buffer.writeCharCode(char);
    }
  }
  return buffer.toString();
}

String addPadding({
  required String message,
  int blockSizeInBytes = 8,
}) {
  if (message.length % blockSizeInBytes == 0) {
    return message;
  }
  final paddingLength = blockSizeInBytes - message.length % blockSizeInBytes;
  final messageWithPadding = '$message${' ' * paddingLength}';
  assert(messageWithPadding.length % blockSizeInBytes == 0);
  return messageWithPadding;
}
