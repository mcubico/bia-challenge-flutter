import 'dart:convert';

class DataContainerBaseModel {
  DataContainerBaseModel({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

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
  final List<dynamic>? results;

  static const String offsetDataName = 'offset';
  static const String limitDataName = 'limit';
  static const String totalDataName = 'total';
  static const String countDataName = 'count';
  static const String resultsDataName = 'results';
}
