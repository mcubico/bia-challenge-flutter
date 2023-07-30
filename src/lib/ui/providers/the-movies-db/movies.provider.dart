import 'package:flutter/material.dart';
import 'package:src/domain/repositories/the-movies-db/repositories.dart';

import '../../../domain/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    _moviesRepo = MoviesRepository();
    _searchRepo = SearchRepository();
    nowPlayingMovies();
    popularMovies();
  }

  Future<void> nowPlayingMovies() async {
    print('Fetching now playing movies');
    moviesData = await _moviesRepo.fetch();

    notifyListeners();
  }

  Future<void> popularMovies() async {
    print('Fetching popular movies');
    List<ItemModel> response = await _moviesRepo.popular();
    popularMoviesData = [...popularMoviesData, ...response];

    notifyListeners();
  }

  Future<List<ItemModel>> creditsMovie(int movieId) async {
    if (moviesCast.containsKey(movieId)) {
      return moviesCast[movieId]!;
    }

    print('Fetching credits movies ($movieId)');
    List<ItemModel> response = await _moviesRepo.creditsMovie(movieId);
    moviesCast[movieId] = response;

    return response;
  }

  Future<List<ItemModel>> searchMovies(String? query) async {
    if (query == null || query.isEmpty) return [];

    if (moviesResultSearch.containsKey(query)) {
      return moviesResultSearch[query]!;
    }

    print('Searching movies ($query)');
    List<ItemModel> response = await _searchRepo.searchMovies(query);
    moviesResultSearch[query] = response;

    return response;
  }

  late final MoviesRepository _moviesRepo;
  late final SearchRepository _searchRepo;
  List<ItemModel> moviesData = [];
  List<ItemModel> popularMoviesData = [];
  Map<int, List<ItemModel>> moviesCast = {};
  Map<String, List<ItemModel>> moviesResultSearch = {};
}
