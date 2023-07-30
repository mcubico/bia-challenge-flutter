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

  late final ComicsRepository _repo;
  List<ItemModel> comics = [];
}
