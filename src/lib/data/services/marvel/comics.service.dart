import 'package:http/http.dart' as http;
import 'package:src/data/services/marvel/marvel_service_base.dart';

import '../../../domain/models/marvel/models.dart';

class ComicsService extends MarvelServiceBase {
  Future<ComicDataWrapperModel> fetchComics() async {
    const String endpoint = 'comics';
    var url = makeUrl(
      endpoint,
      limit: _comicLimitPerPage,
      offSet: (_comicPage++ - 1) * _comicLimitPerPage,
    );

    final response = await http.get(url);
    final ComicDataWrapperModel decodedResponse =
        ComicDataWrapperModel.fromJson(response.body);

    return decodedResponse;
  }

  final int _comicLimitPerPage = 10;
  int _comicPage = 1;
}
