import 'dart:convert';

import 'package:src/domain/models/marvel/models.dart';

class ItemListModel {
  ItemListModel({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  factory ItemListModel.fromJson(String str) =>
      ItemListModel.fromMap(jsonDecode(str));

  factory ItemListModel.fromMap(Map<String, dynamic> json) => ItemListModel(
        available: json[availableDataName],
        collectionUri: json[collectionURIDataName],
        items: List<ItemSummaryModel>.from(
            json[itemsDataName].map((x) => ItemSummaryModel.fromMap(x))),
        returned: json[returnedDataName],
      );

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() => {
        availableDataName: available,
        collectionURIDataName: collectionUri,
        itemsDataName: items != null
            ? List<dynamic>.from(items!.map((x) => x.toMap()))
            : [],
        returnedDataName: returned,
      };

  final int? available;
  final String? collectionUri;
  final List<ItemSummaryModel>? items;
  final int? returned;

  static const String availableDataName = 'available';
  static const String collectionURIDataName = 'collectionURI';
  static const String itemsDataName = 'items';
  static const String returnedDataName = 'returned';
}
