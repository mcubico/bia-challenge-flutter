import 'dart:convert';

class DatesModel {
  DatesModel({
    required this.maximum,
    required this.minimum,
  });

  factory DatesModel.fromJson(String str) =>
      DatesModel.fromMap(json.decode(str));

  String toJson() => jsonEncode(toMap());

  factory DatesModel.fromMap(Map<String, dynamic> json) => DatesModel(
        maximum: DateTime.parse(json[maximumDataName]),
        minimum: DateTime.parse(json[minimumDataName]),
      );

  Map<String, dynamic> toMap() => {
        maximumDataName:
            "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        minimumDataName:
            "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
      };

  final DateTime maximum;
  final DateTime minimum;

  static const String maximumDataName = 'maximum';
  static const String minimumDataName = 'minimum';
}
