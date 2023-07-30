import 'package:http/http.dart' as http;
import 'package:src/data/services/marvel/marvel_service_base.dart';

import '../../../domain/models/marvel/models.dart';

class CharactersService extends MarvelServiceBase {
  Future<CharacterDataWrapperModel> fetchCharacters() async {
    var url = makeUrl(
      _baseEndpoint,
      limit: _characterLimitPerPage,
      offSet: (_charactersPage++ - 1) * _characterLimitPerPage,
    );

    final response = await http.get(url);
    final CharacterDataWrapperModel decodedResponse =
        CharacterDataWrapperModel.fromJson(response.body);

    return decodedResponse;
  }

  Future<CharacterDataWrapperModel> searchCharacters(String query) async {
    var url =
        makeUrl(_baseEndpoint, additionalParameters: {'nameStartsWith': query});

    final response = await http.get(url);
    final CharacterDataWrapperModel decodedResponse =
        CharacterDataWrapperModel.fromJson(response.body);

    return decodedResponse;
  }

  final String _baseEndpoint = 'characters';
  final int _characterLimitPerPage = 10;
  int _charactersPage = 1;
}
