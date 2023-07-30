import 'package:src/domain/interfaces/interfaces.dart';
import 'package:src/domain/models/models.dart';

import '../../../data/services/marvel/services.dart';
import '../../models/marvel/models.dart';

class ComicsRepository implements IBasicDataFetchRepository {
  ComicsRepository() {
    _api = ComicsService();
  }

  @override
  Future<List<ItemModel>> fetch() async {
    ComicDataWrapperModel apiResponse = await _api.fetchComics();
    if (apiResponse.data == null || apiResponse.data?.results == null) {
      return [];
    }

    return _convertApiResponseToItemModel(apiResponse.data!.results!);
  }

  Future<List<ItemModel>> fetchComicsByCharacterId(int characterId) async {
    ComicDataWrapperModel apiResponse =
        await _api.fetchComicsByCharacterId(characterId);
    if (apiResponse.data == null || apiResponse.data?.results == null) {
      return [];
    }

    return _convertApiResponseToItemModel(apiResponse.data!.results!);
  }

  Future<List<ItemModel>> fetchCharactersOfComic(int comicId) async {
    CharacterDataWrapperModel apiResponse =
        await _api.fetchCharactersOfComic(comicId);
    if (apiResponse.data == null || apiResponse.data?.results == null) {
      return [];
    }

    Iterable<ItemModel> response = apiResponse.data!.results!.map(
      (character) => ItemModel(
        id: character.id.toString(),
        posterPathImg: character.fullUrlPosterImg,
        title: character.name,
        overview: character.description,
      ),
    );

    return response.toList();
  }

  List<ItemModel> _convertApiResponseToItemModel(List<ComicModel> comics) {
    Iterable<ItemModel> response = comics.map(
      (comic) => ItemModel(
        id: comic.id.toString(),
        posterPathImg: comic.fullUrlPosterImg,
        title: comic.title,
        overview: comic.description,
        originalTitle: comic.title,
      ),
    );

    return response.toList();
  }

  late final ComicsService _api;
}
