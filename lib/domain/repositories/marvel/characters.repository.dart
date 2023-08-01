import 'package:marvel_finder/domain/models/models.dart';
import 'package:marvel_finder/domain/repositories/marvel/base.repository.dart';

import '../../../data/services/marvel/services.dart';
import '../../models/marvel/models.dart';

class CharactersRepository extends BaseRepository {
  CharactersRepository(super.env) {
    _api = CharactersService(env);
  }

  Future<List<ItemModel>> fetch() async {
    CharacterDataWrapperModel apiResponse = await _api.fetchCharacters();
    if (apiResponse.data == null || apiResponse.data?.results == null) {
      return [];
    }

    return _convertApiResponseToItemModel(apiResponse.data!.results!);
  }

  Future<List<ItemModel>> searchCharacters(String query) async {
    CharacterDataWrapperModel apiResponse = await _api.searchCharacters(query);
    if (apiResponse.data == null || apiResponse.data?.results == null) {
      return [];
    }

    return _convertApiResponseToItemModel(apiResponse.data!.results!);
  }

  List<ItemModel> _convertApiResponseToItemModel(
      List<CharacterModel> characters) {
    Iterable<ItemModel> response = characters.map(
      (character) => ItemModel(
        id: character.id.toString(),
        posterPathImg: character.fullUrlPosterImg,
        title: character.name,
        overview: character.description,
      ),
    );

    return response.toList();
  }

  late final CharactersService _api;
}
