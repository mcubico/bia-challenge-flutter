import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:src/domain/models/the-movies-db/models.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    getMoviesNowPlaying();
  }

  Future<void> getMoviesNowPlaying() async {
    print('getting now playing movies');
    const String endpoint = 'now_playing';
    var url = Uri.https(_baseUrl, '$_segment/$endpoint/', {
      _apiKeyLabel: _apiKeyValue,
      'language': _language,
      'page': '1',
    });

    final response = await http.get(url);
    final NowPlayingMovieResponseModel decodedResponse =
        NowPlayingMovieResponseModel.fromJson(response.body);

    onFetchNowPlayingMovies = decodedResponse.results;

    notifyListeners();
  }

  List<MovieModel> onFetchNowPlayingMovies = [];

  final String _apiKeyLabel = 'api_key';
  final String _apiKeyValue = '4613309449858363e0d3f3dec0565901';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-Es';
  final String _segment = '3/movie';
}
