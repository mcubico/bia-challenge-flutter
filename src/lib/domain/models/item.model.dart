class ItemModel {
  ItemModel({
    required this.id,
    required this.posterPathImg,
    this.title,
    this.overview,
    this.originalTitle,
    this.voteAverage = 0,
    this.backDropPathImg,
  });

  final String id;
  final String posterPathImg;
  final String? title;
  final String? overview;
  final String? originalTitle;
  final double? voteAverage;
  final String? backDropPathImg;
}
