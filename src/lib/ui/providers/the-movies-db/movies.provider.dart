import 'package:flutter/material.dart';
import 'package:src/domain/repositories/the-movies-db/movies.repository.dart';

import '../../../domain/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    _repo = MoviesRepository();
    fetch();
  }

  Future<void> fetch() async {
    movies = await _repo.fetch();
    notifyListeners();
  }

  late final MoviesRepository _repo;
  List<BasicItemModel>? movies = [];
}
