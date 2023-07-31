import 'dart:convert';

import 'package:marvel_finder/domain/models/marvel/models.dart';

class CharacterDataContainerModel extends DataContainerBaseModel {
  CharacterDataContainerModel({
    super.offset,
    super.limit,
    super.total,
    super.count,
    this.results,
  });

  factory CharacterDataContainerModel.fromJson(String data) =>
      CharacterDataContainerModel.fromMap(jsonDecode(data));

  factory CharacterDataContainerModel.fromMap(Map<String, dynamic> jsonData) =>
      CharacterDataContainerModel(
        offset: jsonData[DataContainerBaseModel.offsetDataName],
        limit: jsonData[DataContainerBaseModel.limitDataName],
        total: jsonData[DataContainerBaseModel.totalDataName],
        count: jsonData[DataContainerBaseModel.countDataName],
        results: List<CharacterModel>.from(
          jsonData[DataContainerBaseModel.resultsDataName].map(
            (x) => CharacterModel.fromMap(x),
          ),
        ),
      );

  @override
  // ignore: overridden_fields
  final List<CharacterModel>? results;
}
