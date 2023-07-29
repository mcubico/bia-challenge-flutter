import 'dart:convert';

import 'package:src/domain/models/marvel/character/character.model.dart';

class CharacterDataContainer {
  CharacterDataContainer({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  factory CharacterDataContainer.fromJson(String str) =>
      CharacterDataContainer.fromMap(jsonDecode(str));

  factory CharacterDataContainer.fromMap(Map<String, dynamic> json) =>
      CharacterDataContainer(
        offset: json[offsetDataName],
        limit: json[limitDataName],
        total: json[totalDataName],
        count: json[countDataName],
        results: List<CharacterModel>.from(
          json[resultsDataName].map((x) => CharacterModel.fromMap(x)),
        ),
      );

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() => {
        offsetDataName: offset,
        limitDataName: limit,
        totalDataName: total,
        countDataName: count,
        resultsDataName: results != null
            ? List<dynamic>.from(results!.map((x) => x.toMap()))
            : [],
      };

  final int? offset;
  final int? limit;
  final int? total;
  final int? count;
  final List<CharacterModel>? results;

  static const String offsetDataName = 'offset';
  static const String limitDataName = 'limit';
  static const String totalDataName = 'total';
  static const String countDataName = 'count';
  static const String resultsDataName = 'results';
}
