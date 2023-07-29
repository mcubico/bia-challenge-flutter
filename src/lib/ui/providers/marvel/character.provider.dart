import 'package:flutter/material.dart';
import 'package:src/domain/repositories/marvel/repositories.dart';

import '../../../domain/models/models.dart';

class CharacterProvider extends ChangeNotifier {
  CharacterProvider() {
    _repo = CharactersRepository();
    fetch();
  }

  Future<void> fetch() async {
    characters = await _repo.fetch();
    notifyListeners();
  }

  late final CharactersRepository _repo;
  List<ItemModel> characters = [];
}
