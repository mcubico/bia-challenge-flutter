import 'dart:convert';

class MovieModel {
  MovieModel({
    this.posterPath,
    required this.adult,
    required this.overview,
    this.releaseDate,
    required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.originalLanguage,
    required this.title,
    this.backdropPath,
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.voteAverage,
  });

  factory MovieModel.fromJson(String data) =>
      MovieModel.fromMap(jsonDecode(data));

  factory MovieModel.fromMap(Map<String, dynamic> jsonData) => MovieModel(
        posterPath: jsonData[posterPathDataName],
        adult: jsonData[adultDataName],
        overview: jsonData[overviewDataName],
        releaseDate: jsonData[releaseDateDataName],
        genreIds: List<int>.from(
          jsonData[genreIdsDataName].map((x) => x),
        ),
        id: jsonData[idDataName],
        originalTitle: jsonData[originalTitleDataName],
        originalLanguage: jsonData[originalLanguageDataName],
        title: jsonData[titleDataName],
        backdropPath: jsonData[backdropPathDataName],
        popularity: jsonData[popularityDataName]?.toDouble(),
        voteCount: jsonData[voteCountDataName],
        video: jsonData[videoDataName],
        voteAverage: jsonData[voteAverageDataName]?.toDouble(),
      );

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() => {
        posterPathDataName: posterPath,
        adultDataName: adult,
        overviewDataName: overview,
        releaseDateDataName: releaseDate,
        genreIdsDataName: List<dynamic>.from(genreIds.map((x) => x)),
        idDataName: id,
        originalTitleDataName: originalTitle,
        originalLanguageDataName: originalLanguage,
        titleDataName: title,
        backdropPathDataName: backdropPath,
        popularityDataName: popularity,
        voteCountDataName: voteCount,
        videoDataName: video,
        voteAverageDataName: voteAverage,
      };

  final String? posterPath;
  final bool adult;
  final String overview;
  final String? releaseDate;
  final List<int> genreIds;
  final int id;
  final String originalTitle;
  final String originalLanguage;
  final String title;
  final String? backdropPath;
  final double popularity;
  final int voteCount;
  final bool video;
  final double voteAverage;

  static const posterPathDataName = 'poster_path';
  static const adultDataName = 'adult';
  static const overviewDataName = 'overview';
  static const releaseDateDataName = 'release_date';
  static const genreIdsDataName = 'genre_ids';
  static const idDataName = 'id';
  static const originalTitleDataName = 'original_title';
  static const originalLanguageDataName = 'original_language';
  static const titleDataName = 'title';
  static const backdropPathDataName = 'backdrop_path';
  static const popularityDataName = 'popularity';
  static const voteCountDataName = 'vote_count';
  static const videoDataName = 'video';
  static const voteAverageDataName = 'vote_average';
}
