import 'package:http/http.dart' as http;
import 'package:marvel_finder/data/services/the-movie-db/the_movie_db_service_base.dart';

import '../../../domain/models/the-movies-db/models.dart';

class SearchService extends TheMovieDbServiceBase {
  SearchService() : super(segment: '3/search');

  Future<SearchMovieResponseModel> searchMovies({
    required String query,
    int page = 1,
  }) async {
    const String endpoint = '/movie';
    Uri url = makeUrl(
      endpoint,
      page: page,
      additionalParameters: {'query': query},
    );

    final response = await http.get(url);
    final SearchMovieResponseModel decodedResponse =
        SearchMovieResponseModel.fromJson(response.body);

    return decodedResponse;
  }
}
