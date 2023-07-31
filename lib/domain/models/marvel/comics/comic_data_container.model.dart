import 'dart:convert';

import 'package:marvel_finder/domain/models/marvel/models.dart';

class ComicDataContainerModel extends DataContainerBaseModel {
  ComicDataContainerModel({
    super.offset,
    super.limit,
    super.total,
    super.count,
    this.results,
  });

  factory ComicDataContainerModel.fromJson(String data) =>
      ComicDataContainerModel.fromMap(jsonDecode(data));

  factory ComicDataContainerModel.fromMap(Map<String, dynamic> jsonData) =>
      ComicDataContainerModel(
        offset: jsonData[DataContainerBaseModel.offsetDataName],
        limit: jsonData[DataContainerBaseModel.limitDataName],
        total: jsonData[DataContainerBaseModel.totalDataName],
        count: jsonData[DataContainerBaseModel.countDataName],
        results: List<ComicModel>.from(
          jsonData[DataContainerBaseModel.resultsDataName].map(
            (x) => ComicModel.fromMap(x),
          ),
        ),
      );

  @override
  // ignore: overridden_fields
  final List<ComicModel>? results;
}
