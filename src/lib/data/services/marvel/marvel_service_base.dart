import 'dart:convert';

import 'package:crypto/crypto.dart';

class MarvelServiceBase {
  MarvelServiceBase() {
    _apiKeyValue = pubKey;
    _ts = DateTime.timestamp().millisecondsSinceEpoch;
    _hash = md5.convert(utf8.encode('$_ts$privKey$pubKey')).toString();
  }

  Uri makeUrl(
    String endpoint, {
    int? limit,
    int offSet = 1,
    Map<String, dynamic>? additionalParameters,
  }) {
    Map<String, dynamic> queryParameters = {
      apiKeyLabel: apiKeyValue,
      'ts': '$ts',
      'hash': hash,
    };

    if (additionalParameters != null) {
      queryParameters.addAll(additionalParameters);
    }

    if (limit != null) {
      queryParameters.putIfAbsent('limit', () => '$limit');
      queryParameters.putIfAbsent('offset', () => '$offSet');
    }

    return Uri.https(
      baseUrl,
      '$segment/$endpoint',
      queryParameters,
    );
  }

  String get pubKey => 'ed3a002321f17332118f942cf8ab9499';
  String get privKey => '3ad582cc225e26ee60f24eb388f429d8df6cf60a';
  String get apiKeyLabel => 'apikey';
  String get baseUrl => 'gateway.marvel.com';
  String get segment => '/v1/public';
  String get apiKeyValue => _apiKeyValue;
  int get ts => _ts;
  String get hash => _hash;

  late final String _apiKeyValue;
  late final int _ts;
  late final String _hash;
}
