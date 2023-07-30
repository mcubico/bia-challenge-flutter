import 'package:src/domain/interfaces/interfaces.dart';
import 'package:src/domain/models/models.dart';

import '../../../data/services/marvel/services.dart';
import '../../models/marvel/models.dart';

class ComicsRepository implements IBasicDataFetchRepository {
  ComicsRepository() {
    _api = ComicsService();
  }

  @override
  Future<List<ItemModel>> fetch() async {
    ComicDataWrapperModel apiResponse = await _api.fetch();
    if (apiResponse.data == null || apiResponse.data?.results == null) {
      return [];
    }

    Iterable<ItemModel> response = apiResponse.data!.results!.map(
      (comic) => ItemModel(
        id: comic.id.toString(),
        posterPathImg: comic.fullUrlPosterImg,
        title: comic.title,
        overview: comic.description,
        originalTitle: comic.title,
      ),
    );

    return response.toList();
  }

  late final ComicsService _api;
}
