import 'dart:convert';

import 'package:marvel_finder/domain/models/the-movies-db/fetch_base_response.model.dart';
import 'package:marvel_finder/domain/models/the-movies-db/models.dart';

class PopularMovieResponseModel extends FetchBaseResponseModel {
  PopularMovieResponseModel({
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory PopularMovieResponseModel.fromJson(String data) =>
      PopularMovieResponseModel.fromMap(jsonDecode(data));

  factory PopularMovieResponseModel.fromMap(Map<String, dynamic> jsonData) =>
      PopularMovieResponseModel(
        page: jsonData[FetchBaseResponseModel.pageDataName],
        results: List<MovieModel>.from(
          jsonData[FetchBaseResponseModel.resultsDataName]
              .map((x) => MovieModel.fromMap(x)),
        ),
        totalPages: jsonData[FetchBaseResponseModel.totalPagesDataName],
        totalResults: jsonData[FetchBaseResponseModel.totalResultsDataName],
      );
}
