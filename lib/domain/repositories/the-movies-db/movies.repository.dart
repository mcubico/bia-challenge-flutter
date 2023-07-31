import 'package:marvel_finder/data/services/the-movie-db/services.dart';
import 'package:marvel_finder/domain/interfaces/interfaces.dart';
import 'package:marvel_finder/domain/models/models.dart';

import '../../models/the-movies-db/models.dart';

class MoviesRepository implements IBasicDataFetchRepository {
  MoviesRepository() {
    _api = MoviesService();
  }

  @override
  Future<List<ItemModel>> fetch() async {
    NowPlayingMovieResponseModel apiResponse = await _api.fetchNowPlaying();

    if (apiResponse.results.isEmpty) {
      return [];
    }

    final movies = apiResponse.results as List<MovieModel>;
    return _convertApiResponseToItemModel(movies);
  }

  Future<List<ItemModel>> popular() async {
    PopularMovieResponseModel apiResponse = await _api.fetchPopularMovies();

    if (apiResponse.results.isEmpty) {
      return [];
    }

    final movies = apiResponse.results as List<MovieModel>;
    return _convertApiResponseToItemModel(movies);
  }

  Future<List<ItemModel>> creditsMovie(int movieId) async {
    CreditsResponseModel apiResponse =
        await _api.fetchCreditsByMovieId(movieId);

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
