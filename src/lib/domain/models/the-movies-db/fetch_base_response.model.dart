import 'dart:convert';

import 'package:src/domain/models/the-movies-db/models.dart';

class FetchBaseResponseModel {
  FetchBaseResponseModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
    this.dates,
  });

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() => {
        pageDataName: page,
        resultsDataName: List<dynamic>.from(results.map((x) => x.toMap())),
        datesDataName: dates?.toMap(),
        totalPagesDataName: totalPages,
        totalResultsDataName: totalResults,
      };

  final int page;
  final List<dynamic> results;
  final DatesModel? dates;
  final int totalPages;
  final int totalResults;

  static const String pageDataName = 'page';
  static const String resultsDataName = 'results';
  static const String datesDataName = 'dates';
  static const String totalPagesDataName = 'total_pages';
  static const String totalResultsDataName = 'total_results';
}
