import 'package:flutter/material.dart';
import 'package:src/domain/repositories/the-movies-db/repositories.dart';

import '../../../domain/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    _repo = MoviesRepository();
    nowPlayingMovies();
    popularMovies();
  }

  Future<void> nowPlayingMovies() async {
    moviesData = await _repo.fetch();

    notifyListeners();
  }

  Future<void> popularMovies() async {
    List<BasicItemModel> response = await _repo.popular();
    popularMoviesData = [...popularMoviesData, ...response];

    notifyListeners();
  }

  late final MoviesRepository _repo;
  List<BasicItemModel> moviesData = [];
  List<BasicItemModel> popularMoviesData = [];
}
