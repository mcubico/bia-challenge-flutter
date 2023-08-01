import 'package:http/http.dart' as http;
import 'package:marvel_finder/data/services/marvel/marvel_service_base.dart';

import '../../../domain/models/marvel/models.dart';

class ComicsService extends MarvelServiceBase {
  ComicsService(super.env);

  Future<ComicDataWrapperModel> fetchComics() async {
    Uri url = makeUrl(
      _baseEndpoint,
      limit: _comicLimitPerPage,
      offSet: (_comicPage++ - 1) * _comicLimitPerPage,
    );

    final response = await http.get(url);
    final ComicDataWrapperModel decodedResponse =
        ComicDataWrapperModel.fromJson(response.body);

    return decodedResponse;
  }

  Future<ComicDataWrapperModel> fetchComicsByCharacterId(
      int characterId) async {
    Uri url = makeUrl(
      _baseEndpoint,
      additionalParameters: {'characters': '$characterId'},
    );

    final response = await http.get(url);
    final ComicDataWrapperModel decodedResponse =
        ComicDataWrapperModel.fromJson(response.body);

    return decodedResponse;
  }

  Future<CharacterDataWrapperModel> fetchCharactersOfComic(int comicId) async {
    Uri url = makeUrl('$_baseEndpoint/$comicId/characters');

    final response = await http.get(url);
    final CharacterDataWrapperModel decodedResponse =
        CharacterDataWrapperModel.fromJson(response.body);

    return decodedResponse;
  }

  final String _baseEndpoint = 'comics';
  final int _comicLimitPerPage = 10;
  int _comicPage = 1;
}
