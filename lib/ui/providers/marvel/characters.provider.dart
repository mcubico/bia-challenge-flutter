import 'package:flutter/material.dart';
import 'package:marvel_finder/domain/repositories/marvel/repositories.dart';

import '../../../domain/models/models.dart';

class CharactersProvider extends ChangeNotifier {
  CharactersProvider() {
    _repo = CharactersRepository();
    fetch();
  }

  Future<void> fetch() async {
    print('fetching characters');
    characters = await _repo.fetch();

    notifyListeners();
  }

  Future<List<ItemModel>> searchCharacters(String? query) async {
    if (query == null || query.isEmpty) return [];

    if (charactersResultSearch.containsKey(query)) {
      return charactersResultSearch[query]!;
    }

    print('Searching characters ($query)');
    List<ItemModel> response = await _repo.searchCharacters(query);
    charactersResultSearch[query] = response;

    return response;
  }

  late final CharactersRepository _repo;
  List<ItemModel> characters = [];
  Map<String, List<ItemModel>> charactersResultSearch = {};
}
