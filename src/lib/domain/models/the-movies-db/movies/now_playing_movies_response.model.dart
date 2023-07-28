import 'dart:convert';

import 'package:src/domain/models/the-movies-db/models.dart';

class NowPlayingMovieResponseModel {
  NowPlayingMovieResponseModel({
    required this.page,
    required this.results,
    required this.dates,
    required this.totalPages,
    required this.totalResults,
  });

  factory NowPlayingMovieResponseModel.fromJson(String data) =>
      NowPlayingMovieResponseModel.fromMap(jsonDecode(data));

  factory NowPlayingMovieResponseModel.fromMap(Map<String, dynamic> jsonData) =>
      NowPlayingMovieResponseModel(
        page: jsonData[pageDataName],
        results: List<MovieModel>.from(
          jsonData[resultsDataName].map((x) => MovieModel.fromMap(x)),
        ),
        dates: DatesModel.fromMap(jsonData[datesDataName]),
        totalPages: jsonData[totalPagesDataName],
        totalResults: jsonData[totalResultsDataName],
      );

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() => {
        pageDataName: page,
        resultsDataName: List<dynamic>.from(results.map((x) => x.toMap())),
        datesDataName: dates.toMap(),
        totalPagesDataName: totalPages,
        totalResultsDataName: totalResults,
      };

  final int page;
  final List<MovieModel> results;
  final DatesModel dates;
  final int totalPages;
  final int totalResults;

  static const String pageDataName = 'page';
  static const String resultsDataName = 'results';
  static const String datesDataName = 'dates';
  static const String totalPagesDataName = 'total_pages';
  static const String totalResultsDataName = 'total_results';
}
