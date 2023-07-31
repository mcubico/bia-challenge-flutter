import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MarvelServiceBase {
  MarvelServiceBase() {
    _ts = DateTime.timestamp().millisecondsSinceEpoch;
    _hash = md5.convert(utf8.encode('$_ts$_privKey$_pubKey')).toString();
  }

  Uri makeUrl(
    String endpoint, {
    int? limit,
    int offSet = 1,
    Map<String, dynamic>? additionalParameters,
  }) {
    Map<String, dynamic> queryParameters = {
      _apiKeyLabel: _apiKeyValue,
      'ts': '$_ts',
      'hash': _hash,
    };

    if (additionalParameters != null) {
      queryParameters.addAll(additionalParameters);
    }

    if (limit != null) {
      queryParameters.putIfAbsent('limit', () => '$limit');
      queryParameters.putIfAbsent('offset', () => '$offSet');
    }

    return Uri.https(
      _baseUrl,
      '$_segment/$endpoint',
      queryParameters,
    );
  }

  final String _pubKey = dotenv.get('MARVEL_PUB_KEY');
  final String _privKey = dotenv.get('MARVEL_PRIV_KEY');
  final String _apiKeyLabel = dotenv.get('MARVEL_API_KEY_LABEL');
  final String _baseUrl = dotenv.get('MARVEL_BASE_URL');
  final String _segment = dotenv.get('MARVEL_URL_SEGMENT');
  final String _apiKeyValue = dotenv.get('MARVEL_API_KEY_VALUE');

  late final int _ts;
  late final String _hash;
}
