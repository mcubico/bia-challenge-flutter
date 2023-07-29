class BasicItemModel {
  final String id;
  final String posterPathImg;
  final String? title;
  final String? overview;

  BasicItemModel({
    required this.id,
    required this.posterPathImg,
    this.title,
    this.overview,
  });
}
