import 'package:http/http.dart' as http;
import 'package:src/data/services/marvel/marvel_service_base.dart';

import '../../../domain/models/marvel/models.dart';

class CharactersService extends MarvelServiceBase {
  Future<CharacterDataWrapperModel> fetchCharacters() async {
    const String endpoint = 'characters';
    var url = makeUrl(
      endpoint,
      limit: _characterLimitPerPage,
      offSet: (_charactersPage++ - 1) * _characterLimitPerPage,
    );

    final response = await http.get(url);
    final CharacterDataWrapperModel decodedResponse =
        CharacterDataWrapperModel.fromJson(response.body);

    return decodedResponse;
  }

  final int _characterLimitPerPage = 10;
  int _charactersPage = 1;
}
