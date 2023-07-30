class TheMovieDbServiceBase {
  TheMovieDbServiceBase({required this.segment, this.language = 'es-Es'}) {
    _apiKeyLabel = 'api_key';
    _apiKeyValue = '4613309449858363e0d3f3dec0565901';
    _baseUrl = 'api.themoviedb.org';
  }

  Uri makeUrl(
    String endpoint, {
    int page = 1,
    Map<String, dynamic>? additionalParameters,
  }) {
    Map<String, dynamic> queryParameters = {
      _apiKeyLabel: _apiKeyValue,
      'language': language,
      'page': '$page',
    };

    if (additionalParameters != null) {
      queryParameters.addAll(additionalParameters);
    }

    return Uri.https(
      _baseUrl,
      '$segment/$endpoint',
      queryParameters,
    );
  }

  late final String segment;
  late final String? language;

  late final String _apiKeyLabel;
  late final String _apiKeyValue;
  late final String _baseUrl;
}
