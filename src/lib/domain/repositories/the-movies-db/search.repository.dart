import 'package:src/data/services/the-movie-db/services.dart';
import 'package:src/domain/models/models.dart';

import '../../models/the-movies-db/models.dart';

class SearchRepository {
  SearchRepository() {
    _api = SearchService();
  }

  Future<List<ItemModel>> searchMovies(String query) async {
    SearchMovieResponseModel apiResponse = await _api.searchMovies(
      query: query,
    );

    if (apiResponse.results.isEmpty) {
      return [];
    }

    final movies = apiResponse.results as List<MovieModel>;
    return _convertApiResponseToItemModel(movies);
  }

  List<ItemModel> _convertApiResponseToItemModel(List<MovieModel> movies) {
    Iterable<ItemModel> response = movies.map(
      (movie) => ItemModel(
        posterPathImg: movie.fullUrlPosterImg,
        id: movie.id.toString(),
        title: movie.originalTitle,
        overview: movie.overview,
        originalTitle: movie.originalTitle,
        voteAverage: movie.voteAverage,
        backDropPathImg: movie.fullUrlBackDropImg,
      ),
    );

    return response.toList();
  }

  late final SearchService _api;
}
