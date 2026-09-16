import 'dart:convert' as dart_convert;

import 'package:enough_convert/enough_convert.dart';
import 'package:test/test.dart';

void main() {
  const codec = Windows1255Codec();
  const allowInvalidCodec = Windows1255Codec(allowInvalid: true);

  const ascii = 'hello world';
  final asciiBytes = dart_convert.ascii.encode(ascii);

  const windows1255 = 'שלום';
  const windows1255Bytes = [0xF9, 0xEC, 0xE5, 0xED];

  const windows1255WithPoints = 'שָׁלוֹם';
  const windows1255WithPointsBytes = [0xF9, 0xC8, 0xD1, 0xEC, 0xE5, 0xC9, 0xED];

  const windows1255Invalid = 'שלום�';
  const windows1255InvalidBytes = [0xF9, 0xEC, 0xE5, 0xED, 0xFF1];

  group('Codec tests', () {
    test('name', () {
      expect(codec.name, 'windows-1255');
    });

    test('Decoder/encoder classes', () {
      expect(codec.encoder, isA<Windows1255Encoder>());
      expect(codec.decoder, isA<Windows1255Decoder>());
    });

    test('Round trip', () {
      final encoded = codec.encode(windows1255WithPoints);
      final decoded = codec.decode(encoded);
      expect(decoded, windows1255WithPoints);
    });
  });

  group('Decoder tests', () {
    test('Decodes ASCII', () {
      expect(codec.decode(asciiBytes), ascii);
    });

    test('Decodes windows-1255', () {
      expect(codec.decode(windows1255Bytes), windows1255);
    });

    test('Decodes windows-1255 with points', () {
      expect(codec.decode(windows1255WithPointsBytes), windows1255WithPoints);
    });

    test('Throws FormatException if invalid input not allowed', () {
      expect(() => codec.decode(windows1255InvalidBytes),
          throwsA(isA<FormatException>()));
    });

    test('Decodes invalid input to � if invalid input allowed', () {
      expect(allowInvalidCodec.decode(windows1255InvalidBytes),
          windows1255Invalid);
    });
  });

  group('Encoder tests', () {
    test('Encodes ASCII', () {
      expect(codec.encode(ascii), asciiBytes);
    });

    test('Encodes windows-1255', () {
      expect(codec.encode(windows1255), windows1255Bytes);
    });

    test('Encodes windows-1255 with points', () {
      expect(codec.encode(windows1255WithPoints), windows1255WithPointsBytes);
    });

    test('Throws FormatException if invalid input not allowed', () {
      expect(() => codec.encode(windows1255Invalid),
          throwsA(isA<FormatException>()));
    });

    test('Encodes invalid input', () {
      expect(allowInvalidCodec.encode(windows1255Invalid),
          [0xF9, 0xEC, 0xE5, 0xED, 0x3F]);
    });
  });
}
