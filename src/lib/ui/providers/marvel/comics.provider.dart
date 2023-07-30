import 'package:flutter/material.dart';
import 'package:src/domain/repositories/marvel/repositories.dart';

import '../../../domain/models/models.dart';

class ComicsProvider extends ChangeNotifier {
  ComicsProvider() {
    _repo = ComicsRepository();
    fetch();
  }

  Future<void> fetch() async {
    print('fetching comics');
    List<ItemModel> response = await _repo.fetch();
    comics = [...comics, ...response];

    notifyListeners();
  }

  Future<List<ItemModel>> fetchComicsByCharacterId(int characterId) async {
    if (comicsOfCharacter.containsKey(characterId)) {
      return comicsOfCharacter[characterId]!;
    }

    print('Fetching comics of character ($characterId)');
    List<ItemModel> response =
        await _repo.fetchComicsByCharacterId(characterId);
    comicsOfCharacter[characterId] = response;

    return response;
  }

  Future<List<ItemModel>> fetchCharactersOfComic(int comicId) async {
    if (charactersOfComic.containsKey(comicId)) {
      return charactersOfComic[comicId]!;
    }

    print('Fetching character of comics ($comicId)');
    List<ItemModel> response = await _repo.fetchCharactersOfComic(comicId);
    charactersOfComic[comicId] = response;

    return response;
  }

  late final ComicsRepository _repo;
  List<ItemModel> comics = [];
  Map<int, List<ItemModel>> comicsOfCharacter = {};
  Map<int, List<ItemModel>> charactersOfComic = {};
}
