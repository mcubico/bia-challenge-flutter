import 'package:src/domain/interfaces/interfaces.dart';
import 'package:src/domain/models/models.dart';

import '../../../data/services/marvel/services.dart';
import '../../models/marvel/models.dart';

class CharactersRepository implements IBasicDataFetchRepository {
  CharactersRepository() {
    _api = CharactersService();
  }

  @override
  Future<List<ItemModel>> fetch() async {
    CharacterDataWrapperModel apiResponse = await _api.fetchCharacters();
    if (apiResponse.data == null || apiResponse.data?.results == null) {
      return [];
    }

    Iterable<ItemModel> response = apiResponse.data!.results!.map((character) =>
        ItemModel(
            posterPathImg: character.fullUrlPosterImg,
            id: character.id.toString()));

    return response.toList();
  }

  late final CharactersService _api;
}
