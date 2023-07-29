import 'package:http/http.dart' as http;
import 'package:src/data/services/the-movie-db/the_movie_db_service_base.dart';

import '../../../domain/models/the-movies-db/models.dart';

class MoviesService extends TheMovieDbServiceBase {
  Future<NowPlayingMovieResponseModel> nowPlaying() async {
    const String endpoint = 'now_playing';
    var url = _makeUrl(endpoint, page: 1);

    final response = await http.get(url);
    final NowPlayingMovieResponseModel decodedResponse =
        NowPlayingMovieResponseModel.fromJson(response.body);

    return decodedResponse;
  }

  Future<PopularMovieResponseModel> popular() async {
    const String endpoint = 'popular';
    var url = _makeUrl(endpoint, page: 1);

    final response = await http.get(url);
    final PopularMovieResponseModel decodedResponse =
        PopularMovieResponseModel.fromJson(response.body);

    return decodedResponse;
  }

  _makeUrl(String endpoint, {int page = 1}) =>
      Uri.https(baseUrl, '$segment/$endpoint/', {
        apiKeyLabel: apiKeyValue,
        'language': language,
        'page': '$page',
      });
}
