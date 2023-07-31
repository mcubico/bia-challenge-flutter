import '../../models/models.dart';

abstract class IBasicDataFetchRepository {
  Future<List<ItemModel>> fetch();
}
