import 'package:src/data/services/the-movie-db/services.dart';
import 'package:src/domain/interfaces/interfaces.dart';
import 'package:src/domain/models/models.dart';

import '../../models/the-movies-db/models.dart';

class MoviesRepository implements IBasicDataFetchRepository {
  MoviesRepository() {
    _api = MoviesService();
  }

  @override
  Future<List<BasicItemModel>> fetch() async {
    NowPlayingMovieResponseModel apiResponse = await _api.nowPlaying();

    if (apiResponse.results.isEmpty) {
      return [];
    }

    final movies = apiResponse.results as List<MovieModel>;
    Iterable<BasicItemModel> response = movies.map(
      (movie) => BasicItemModel(
        posterPathImg: movie.fullUrlPosterImg,
        id: movie.id.toString(),
      ),
    );

    return response.toList();
  }

  Future<List<BasicItemModel>> popular() async {
    PopularMovieResponseModel apiResponse = await _api.popular();

    if (apiResponse.results.isEmpty) {
      return [];
    }

    final movies = apiResponse.results as List<MovieModel>;
    Iterable<BasicItemModel> response = movies.map(
      (movie) => BasicItemModel(
        posterPathImg: movie.fullUrlPosterImg,
        id: movie.id.toString(),
        title: movie.originalTitle,
        overview: movie.overview,
      ),
    );

    return response.toList();
  }

  late final MoviesService _api;
}
