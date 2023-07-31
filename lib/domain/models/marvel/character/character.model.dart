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
        id: json[idDataName],
        name: json[nameDataName],
        description: json[descriptionDataName],
        modified: json[modifiedDataName],
        thumbnail: ThumbnailModel.fromMap(json[thumbnailDataName]),
        resourceUri: json[resourceUriDataName],
        comics: ItemListModel.fromMap(json[comicsDataName]),
        series: ItemListModel.fromMap(json[seriesDataName]),
        stories: ItemListModel.fromMap(json[storiesDataName]),
        events: ItemListModel.fromMap(json[eventsDataName]),
        urls: List<UrlModel>.from(
          json[urlsDataName].map(
            (x) => UrlModel.fromMap(x),
          ),
        ),
      );

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() => {
        idDataName: id,
        nameDataName: name,
        descriptionDataName: description,
        modifiedDataName: modified,
        thumbnailDataName: thumbnail?.toMap(),
        resourceUriDataName: resourceUri,
        comicsDataName: comics?.toMap(),
        seriesDataName: series?.toMap(),
        storiesDataName: stories?.toMap(),
        eventsDataName: events?.toMap(),
        urlsDataName:
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

  static String idDataName = 'id';
  static String nameDataName = 'name';
  static String descriptionDataName = 'description';
  static String modifiedDataName = 'modified';
  static String thumbnailDataName = 'thumbnail';
  static String resourceUriDataName = 'resourceUri';
  static String comicsDataName = 'comics';
  static String seriesDataName = 'series';
  static String storiesDataName = 'stories';
  static String eventsDataName = 'events';
  static String urlsDataName = 'urls';
}
