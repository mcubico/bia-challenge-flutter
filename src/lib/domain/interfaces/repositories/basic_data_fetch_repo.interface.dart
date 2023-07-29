import '../../models/models.dart';

abstract class IBasicDataFetchRepository {
  Future<List<BasicItemModel>> fetch();
}
