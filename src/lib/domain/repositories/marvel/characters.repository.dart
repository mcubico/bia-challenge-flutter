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
