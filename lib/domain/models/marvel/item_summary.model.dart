import 'dart:convert';

class ItemSummaryModel {
  ItemSummaryModel({
    required this.resourceUri,
    required this.name,
    this.type,
  });

  factory ItemSummaryModel.fromJson(String str) =>
      ItemSummaryModel.fromMap(jsonDecode(str));

  factory ItemSummaryModel.fromMap(Map<String, dynamic> json) =>
      ItemSummaryModel(
        resourceUri: json[resourceURIDataName],
        name: json[nameDataName],
        type: json[typeDataName],
      );

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() => {
        resourceURIDataName: resourceUri,
        nameDataName: name,
        typeDataName: type,
      };

  final String resourceUri;
  final String name;
  final String? type;

  static const String resourceURIDataName = 'resourceURI';
  static const String nameDataName = 'name';
  static const String typeDataName = 'type';
}
