import 'dart:convert';

class ThumbnailModel {
  ThumbnailModel({
    required this.path,
    required this.extension,
  });

  factory ThumbnailModel.fromJson(String str) =>
      ThumbnailModel.fromMap(jsonDecode(str));

  factory ThumbnailModel.fromMap(Map<String, dynamic> json) => ThumbnailModel(
        path: json[pathDataName],
        extension: json[extensionDataName],
      );

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() => {
        pathDataName: path,
        extensionDataName: extension,
      };

  final String path;
  final String extension;

  static const String pathDataName = 'path';
  static const String extensionDataName = 'extension';
}
