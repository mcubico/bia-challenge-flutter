import 'package:http/http.dart' as http;
import 'package:src/data/services/marvel/marvel_service_base.dart';

import '../../../domain/models/marvel/models.dart';

class CharactersService extends MarvelServiceBase {
  Future<CharacterDataWrapperModel> fetch() async {
    const String endpoint = 'characters';
    var url = Uri.https(baseUrl, '$segment/$endpoint', {
      apiKeyLabel: apiKeyValue,
      'ts': ts.toString(),
      'hash': hash,
    });

    final response = await http.get(url);
    final CharacterDataWrapperModel decodedResponse =
        CharacterDataWrapperModel.fromJson(response.body);

    return decodedResponse;
  }
}
