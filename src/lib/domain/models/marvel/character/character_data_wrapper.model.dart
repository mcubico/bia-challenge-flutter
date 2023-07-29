import 'dart:convert';

import '../models.dart';

class CharacterDataWrapperModel {
  final int? code;
  final String? status;
  final String? copyright;
  final String? attributionText;
  final String? attributionHtml;
  final String? etag;
  final CharacterDataContainer? data;

  CharacterDataWrapperModel({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });

  factory CharacterDataWrapperModel.fromJson(String str) =>
      CharacterDataWrapperModel.fromMap(jsonDecode(str));

  factory CharacterDataWrapperModel.fromMap(Map<String, dynamic> json) =>
      CharacterDataWrapperModel(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: CharacterDataContainer.fromMap(json["data"]),
      );

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "etag": etag,
        "data": data?.toMap(),
      };
}
