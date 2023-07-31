import 'dart:convert';

import 'package:marvel_finder/domain/models/the-movies-db/fetch_base_response.model.dart';
import 'package:marvel_finder/domain/models/the-movies-db/models.dart';

class NowPlayingMovieResponseModel extends FetchBaseResponseModel {
  NowPlayingMovieResponseModel({
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
    super.dates,
  });

  factory NowPlayingMovieResponseModel.fromJson(String data) =>
      NowPlayingMovieResponseModel.fromMap(jsonDecode(data));

  factory NowPlayingMovieResponseModel.fromMap(Map<String, dynamic> jsonData) =>
      NowPlayingMovieResponseModel(
        page: jsonData[FetchBaseResponseModel.pageDataName],
        results: List<MovieModel>.from(
          jsonData[FetchBaseResponseModel.resultsDataName]
              .map((x) => MovieModel.fromMap(x)),
        ),
        dates:
            DatesModel.fromMap(jsonData[FetchBaseResponseModel.datesDataName]),
        totalPages: jsonData[FetchBaseResponseModel.totalPagesDataName],
        totalResults: jsonData[FetchBaseResponseModel.totalResultsDataName],
      );
}
