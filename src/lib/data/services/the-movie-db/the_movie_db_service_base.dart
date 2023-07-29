class TheMovieDbServiceBase {
  TheMovieDbServiceBase() {
    apiKeyLabel = 'api_key';
    apiKeyValue = '4613309449858363e0d3f3dec0565901';
    baseUrl = 'api.themoviedb.org';
    language = 'es-Es';
    segment = '3/movie';
  }

  late final String apiKeyLabel;
  late final String apiKeyValue;
  late final String baseUrl;
  late final String language;
  late final String segment;
}
