import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'dart:convert';

import '../../../domain/models/marvel/models.dart';

class CharacterNotifierProvider extends ChangeNotifier {
  late final String _pubKey;
  late final String _privKey;
  late final String _apiKeyLabel;
  late final String _apiKeyValue;
  late final int _ts;
  late final String _hash;
  late final String _baseUrl;
  late final String _segment;

  CharacterNotifierProvider() {
    print('Character Provider Start');

    _pubKey = 'ed3a002321f17332118f942cf8ab9499';
    _privKey = '3ad582cc225e26ee60f24eb388f429d8df6cf60a';
    _apiKeyLabel = 'apikey';
    _apiKeyValue = _pubKey;
    _ts = DateTime.timestamp().millisecondsSinceEpoch;
    _baseUrl = 'gateway.marvel.com';
    _segment = '/v1/public';
    _hash = md5.convert(utf8.encode('$_ts$_privKey$_pubKey')).toString();

    getAll();
  }

  Future<void> getAll() async {
    print('getting all characters');
    const String endpoint = 'characters';
    var url = Uri.https(_baseUrl, '$_segment/$endpoint', {
      _apiKeyLabel: _apiKeyValue,
      'ts': _ts.toString(),
      'hash': _hash,
    });

    final response = await http.get(url);
    final CharacterDataWrapperModel decodedResponse =
        CharacterDataWrapperModel.fromJson(response.body);

    print(decodedResponse.status);
  }
}
