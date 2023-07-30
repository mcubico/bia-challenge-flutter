import 'dart:convert';

import 'package:src/domain/models/the-movies-db/fetch_base_response.model.dart';

import 'movie.model.dart';

class SearchMovieResponseModel extends FetchBaseResponseModel {
  SearchMovieResponseModel({
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory SearchMovieResponseModel.fromJson(String data) =>
      SearchMovieResponseModel.fromMap(jsonDecode(data));

  factory SearchMovieResponseModel.fromMap(Map<String, dynamic> jsonData) =>
      SearchMovieResponseModel(
        page: jsonData[FetchBaseResponseModel.pageDataName],
        results: List<MovieModel>.from(
          jsonData[FetchBaseResponseModel.resultsDataName]
              .map((x) => MovieModel.fromMap(x)),
        ),
        totalPages: jsonData[FetchBaseResponseModel.totalPagesDataName],
        totalResults: jsonData[FetchBaseResponseModel.totalResultsDataName],
      );
}
