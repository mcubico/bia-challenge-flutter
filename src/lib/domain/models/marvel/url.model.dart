import 'dart:convert';

class UrlModel {
  UrlModel({
    required this.type,
    required this.url,
  });

  factory UrlModel.fromJson(String str) => UrlModel.fromMap(jsonDecode(str));

  factory UrlModel.fromMap(Map<String, dynamic> json) => UrlModel(
        type: json[typeDataName],
        url: json[urlDataName],
      );

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() => {
        typeDataName: type,
        urlDataName: url,
      };

  final String type;
  final String url;

  static const String typeDataName = 'type';
  static const String urlDataName = 'url';
}
