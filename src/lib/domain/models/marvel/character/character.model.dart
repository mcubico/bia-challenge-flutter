import 'dart:convert';

import '../models.dart';

class CharacterModel {
  CharacterModel({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.thumbnail,
    this.resourceUri,
    this.comics,
    this.series,
    this.stories,
    this.events,
    this.urls,
  });

  factory CharacterModel.fromJson(String str) =>
      CharacterModel.fromMap(jsonDecode(str));

  factory CharacterModel.fromMap(Map<String, dynamic> json) => CharacterModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        modified: json["modified"],
        thumbnail: ThumbnailModel.fromMap(json["thumbnail"]),
        resourceUri: json["resourceURI"],
        comics: ItemListModel.fromMap(json["comics"]),
        series: ItemListModel.fromMap(json["series"]),
        stories: ItemListModel.fromMap(json["stories"]),
        events: ItemListModel.fromMap(json["events"]),
        urls: List<UrlModel>.from(json["urls"].map((x) => UrlModel.fromMap(x))),
      );

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "modified": modified,
        "thumbnail": thumbnail?.toMap(),
        "resourceURI": resourceUri,
        "comics": comics?.toMap(),
        "series": series?.toMap(),
        "stories": stories?.toMap(),
        "events": events?.toMap(),
        "urls":
            urls != null ? List<dynamic>.from(urls!.map((x) => x.toMap())) : [],
      };

  get fullUrlPosterImg => thumbnail != null
      ? '${thumbnail?.path}.${thumbnail?.extension}'
      : 'https://i.stack.imgur.com/GNhx0.png';

  final int? id;
  final String? name;
  final String? description;
  final String? modified;
  final ThumbnailModel? thumbnail;
  final String? resourceUri;
  final ItemListModel? comics;
  final ItemListModel? series;
  final ItemListModel? stories;
  final ItemListModel? events;
  final List<UrlModel>? urls;
}
