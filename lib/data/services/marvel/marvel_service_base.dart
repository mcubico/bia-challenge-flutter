import 'dart:convert';

import 'package:crypto/crypto.dart';

import '../../../interfaces/interfaces.dart';

class MarvelServiceBase {
  MarvelServiceBase(this.env) {
    _ts = DateTime.timestamp().millisecondsSinceEpoch;
    _hash = md5
        .convert(
            utf8.encode('$_ts${env.marvelPrivateKey}${env.marvelPublicKey}'))
        .toString();
  }

  Uri makeUrl(
    String endpoint, {
    int? limit,
    int offSet = 1,
    Map<String, dynamic>? additionalParameters,
  }) {
    Map<String, dynamic> queryParameters = {
      env.marvelApiKeyLabel: env.marvelApiKeyValue,
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
      env.marvelBaseUrl,
      '${env.marvelSegmentUrl}/$endpoint',
      queryParameters,
    );
  }

  final IApiEnvConfig env;

  late final int _ts;
  late final String _hash;
}
