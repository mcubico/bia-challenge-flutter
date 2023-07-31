import 'dart:convert';

import '../models.dart';

class CreditsResponseModel {
  CreditsResponseModel({
    required this.id,
    required this.cast,
  });

  factory CreditsResponseModel.fromJson(String str) =>
      CreditsResponseModel.fromMap(jsonDecode(str));

  String toJson() => jsonEncode(toMap());

  factory CreditsResponseModel.fromMap(Map<String, dynamic> json) =>
      CreditsResponseModel(
        id: json[idDataName],
        cast: List<CastModel>.from(
            json[castDataName].map((x) => CastModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        idDataName: id,
        castDataName: List<dynamic>.from(cast.map((x) => x.toMap())),
      };

  final int id;
  final List<CastModel> cast;

  static const String idDataName = 'id';
  static const String castDataName = 'cast';
}
