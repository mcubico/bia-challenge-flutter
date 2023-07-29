import 'package:src/data/services/the-movie-db/movies.service.dart';
import 'package:src/domain/interfaces/interfaces.dart';
import 'package:src/domain/models/basic_item.model.dart';

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

    Iterable<BasicItemModel> response = apiResponse.results.map((movie) =>
        BasicItemModel(
            posterPathImg: movie.fullUrlPosterImg, id: movie.id.toString()));

    return response.toList();
  }

  late final MoviesService _api;
}
