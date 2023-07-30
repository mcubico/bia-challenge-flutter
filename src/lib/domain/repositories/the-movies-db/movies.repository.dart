import 'package:src/data/services/the-movie-db/services.dart';
import 'package:src/domain/interfaces/interfaces.dart';
import 'package:src/domain/models/models.dart';

import '../../models/the-movies-db/models.dart';

class MoviesRepository implements IBasicDataFetchRepository {
  MoviesRepository() {
    _api = MoviesService();
  }

  @override
  Future<List<ItemModel>> fetch() async {
    NowPlayingMovieResponseModel apiResponse = await _api.nowPlaying();

    if (apiResponse.results.isEmpty) {
      return [];
    }

    final movies = apiResponse.results as List<MovieModel>;
    return _convertApiResponseToItemModel(movies);
  }

  Future<List<ItemModel>> popular() async {
    PopularMovieResponseModel apiResponse = await _api.popular();

    if (apiResponse.results.isEmpty) {
      return [];
    }

    final movies = apiResponse.results as List<MovieModel>;
    return _convertApiResponseToItemModel(movies);
  }

  Future<List<ItemModel>> creditsMovies(int movieId) async {
    CreditsResponseModel apiResponse = await _api.credits(movieId);

    if (apiResponse.cast.isEmpty) {
      return [];
    }

    final cast = apiResponse.cast;
    Iterable<ItemModel> response = cast.map(
      (actor) => ItemModel(
        posterPathImg: actor.fullUrlPosterImg,
        id: '${actor.id}',
        title: actor.name,
        voteAverage: actor.popularity,
      ),
    );

    return response.toList();
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

  late final MoviesService _api;
}
