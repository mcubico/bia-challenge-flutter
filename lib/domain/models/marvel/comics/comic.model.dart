import 'dart:convert';

import '../models.dart';

class ComicModel {
  ComicModel({
    this.id,
    this.digitalId,
    this.title,
    this.variantDescription,
    this.description,
    this.thumbnail,
  });

  factory ComicModel.fromJson(String str) =>
      ComicModel.fromMap(jsonDecode(str));

  factory ComicModel.fromMap(Map<String, dynamic> json) => ComicModel(
        id: json[idDataName],
        digitalId: json[digitalIdDataName],
        title: json[titleDataName],
        variantDescription: json[variantDescriptionDataName],
        description: json[descriptionDataName],
        thumbnail: ThumbnailModel.fromMap(json[thumbnailDataName]),
      );

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() => {
        idDataName: id,
        digitalIdDataName: digitalId,
        titleDataName: title,
        variantDescriptionDataName: variantDescription,
        descriptionDataName: description,
        thumbnailDataName: thumbnail?.toMap(),
      };

  get fullUrlPosterImg => thumbnail != null
      ? '${thumbnail?.path}.${thumbnail?.extension}'
      : 'https://i.stack.imgur.com/GNhx0.png';

  final int? id;
  final int? digitalId;
  final String? title;
  final String? variantDescription;
  final String? description;
  final ThumbnailModel? thumbnail;

  static String idDataName = 'id';
  static String digitalIdDataName = 'digitalId';
  static String titleDataName = 'title';
  static String variantDescriptionDataName = 'variantDescription';
  static String descriptionDataName = 'description';
  static String thumbnailDataName = 'thumbnail';
}
