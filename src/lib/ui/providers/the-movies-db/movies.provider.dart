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
    print('Fetching now playing movies');
    moviesData = await _repo.fetch();

    notifyListeners();
  }

  Future<void> popularMovies() async {
    print('Fetching popular movies');
    List<ItemModel> response = await _repo.popular();
    popularMoviesData = [...popularMoviesData, ...response];

    notifyListeners();
  }

  Future<List<ItemModel>> creditsMovies(int movieId) async {
    if (moviesCast.containsKey(movieId)) {
      return moviesCast[movieId]!;
    }

    print('Fetching credits movies ($movieId)');
    List<ItemModel> response = await _repo.creditsMovies(movieId);
    moviesCast[movieId] = response;

    return response;
  }

  late final MoviesRepository _repo;
  List<ItemModel> moviesData = [];
  List<ItemModel> popularMoviesData = [];
  Map<int, List<ItemModel>> moviesCast = {};
}
