import 'dart:convert' as dart_convert;

import 'windows.dart';

/// Provides a windows 1255 / cp1255 codec for easy encoding and decoding.
class Windows1255Codec extends dart_convert.Encoding {
  /// Creates a new []
  ///
  /// Set [allowInvalid] to `true` for ignoring invalid data.
  /// When invalid data is allowed it  will be encoded to ? and decoded to �
  const Windows1255Codec({this.allowInvalid = false});

  /// Should invalid character codes be ignored?
  ///
  /// When `false`, an invalid character code
  /// will throw [FormatException].
  final bool allowInvalid;

  @override
  dart_convert.Converter<List<int>, String> get decoder => allowInvalid
      ? const Windows1255Decoder(allowInvalid: true)
      : const Windows1255Decoder(allowInvalid: false);

  @override
  dart_convert.Converter<String, List<int>> get encoder => allowInvalid
      ? const Windows1255Encoder(allowInvalid: true)
      : const Windows1255Encoder(allowInvalid: false);

  @override
  String get name => 'windows-1255';
}

/// Decodes windows 1255 / cp1255 data.
class Windows1255Decoder extends WindowsDecoder {
  /// Creates a new []
  ///
  /// Set [allowInvalid] to `true` for ignoring invalid data.
  /// When invalid data is allowed it  will be decoded to �
  const Windows1255Decoder({bool allowInvalid = false})
      : super(_cp1255Symbols, allowInvalid: allowInvalid);
}

/// Encodes texts into windows 1255 data
class Windows1255Encoder extends WindowsEncoder {
  /// Creates a new []
  ///
  /// Set [allowInvalid] to `true` for ignoring invalid data.
  /// When invalid data is allowed it  will be encoded to ?
  const Windows1255Encoder({bool allowInvalid = false})
      : super(_cp1255Map, allowInvalid: allowInvalid);
}

const String _cp1255Symbols =
    '€?‚ƒ„…†‡ˆ‰?‹?????‘’“”•–—˜™?›????\u{00A0}¡¢£₪¥¦§¨©×«¬\u{00AD}'
    '®¯°±²³´µ¶·¸¹÷»¼½¾¿'
    'ְֱֲֳִֵֶַָֹֺֻּֽ־ֿ'
    '׀ׁׂ׃'
    'װױײ׳״'
    '???????'
    'אבגדהוזחטיךכלםמןנסעףפץצקרשת'
    '??'
    '\u{200E}\u{200F}'
    '?';

const Map<int, int> _cp1255Map = {
  8364: 128,
  8218: 130,
  402: 131,
  8222: 132,
  8230: 133,
  8224: 134,
  8225: 135,
  710: 136,
  8240: 137,
  8249: 139,
  8216: 145,
  8217: 146,
  8220: 147,
  8221: 148,
  8226: 149,
  8211: 150,
  8212: 151,
  732: 152,
  8482: 153,
  8250: 155,
  160: 160,
  161: 161,
  162: 162,
  163: 163,
  8362: 164,
  165: 165,
  166: 166,
  167: 167,
  168: 168,
  169: 169,
  215: 170,
  171: 171,
  172: 172,
  173: 173,
  174: 174,
  175: 175,
  176: 176,
  177: 177,
  178: 178,
  179: 179,
  180: 180,
  181: 181,
  182: 182,
  183: 183,
  184: 184,
  185: 185,
  247: 186,
  187: 187,
  188: 188,
  189: 189,
  190: 190,
  191: 191,
  1456: 192,
  1457: 193,
  1458: 194,
  1459: 195,
  1460: 196,
  1461: 197,
  1462: 198,
  1463: 199,
  1464: 200,
  1465: 201,
  1467: 203,
  1468: 204,
  1469: 205,
  1470: 206,
  1471: 207,
  1472: 208,
  1473: 209,
  1474: 210,
  1475: 211,
  1520: 212,
  1521: 213,
  1522: 214,
  1523: 215,
  1524: 216,
  1488: 224,
  1489: 225,
  1490: 226,
  1491: 227,
  1492: 228,
  1493: 229,
  1494: 230,
  1495: 231,
  1496: 232,
  1497: 233,
  1498: 234,
  1499: 235,
  1500: 236,
  1501: 237,
  1502: 238,
  1503: 239,
  1504: 240,
  1505: 241,
  1506: 242,
  1507: 243,
  1508: 244,
  1509: 245,
  1510: 246,
  1511: 247,
  1512: 248,
  1513: 249,
  1514: 250,
  8206: 253,
  8207: 254,
};
