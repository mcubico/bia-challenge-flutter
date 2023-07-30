class TheMovieDbServiceBase {
  TheMovieDbServiceBase() {
    apiKeyLabel = 'api_key';
    apiKeyValue = '4613309449858363e0d3f3dec0565901';
    baseUrl = 'api.themoviedb.org';
    language = 'es-Es';
    segment = '3/movie';
  }

  makeUrl(String endpoint, {int page = 1}) => Uri.https(
        baseUrl,
        '$segment/$endpoint/',
        {
          apiKeyLabel: apiKeyValue,
          'language': language,
          'page': '$page',
        },
      );

  late final String apiKeyLabel;
  late final String apiKeyValue;
  late final String baseUrl;
  late final String language;
  late final String segment;
}
