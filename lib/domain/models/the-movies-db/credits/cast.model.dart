import 'dart:convert';

class CastModel {
  CastModel({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
    required this.department,
    required this.job,
  });

  factory CastModel.fromJson(String str) => CastModel.fromMap(jsonDecode(str));

  factory CastModel.fromMap(Map<String, dynamic> json) => CastModel(
        adult: json[adultDataName],
        gender: json[genderDataName],
        id: json[idDataName],
        knownForDepartment: json[knownForDepartmentDataName],
        name: json[nameDataName],
        originalName: json[originalNameDataName],
        popularity: json[popularityDataName]?.toDouble(),
        profilePath: json[profilePathDataName],
        castId: json[castIdDataName],
        character: json[characterDataName],
        creditId: json[creditIdDataName],
        order: json[orderDataName],
        department: json[departmentDataName],
        job: json[jobDataName],
      );

  String get fullUrlPosterImg => profilePath != null
      ? 'https://image.tmdb.org/t/p/w500$profilePath'
      : 'https://img.freepik.com/iconos-gratis/hacker_318-917074.jpg';

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() => {
        adultDataName: adult,
        genderDataName: gender,
        idDataName: id,
        knownForDepartmentDataName: knownForDepartment,
        nameDataName: name,
        originalNameDataName: originalName,
        popularityDataName: popularity,
        profilePathDataName: profilePath,
        castIdDataName: castId,
        characterDataName: character,
        creditIdDataName: creditId,
        orderDataName: order,
        departmentDataName: department,
        jobDataName: job,
      };

  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final int? castId;
  final String? character;
  final String? creditId;
  final int? order;
  final String? department;
  final String? job;

  static const String adultDataName = 'adult';
  static const String genderDataName = 'gender';
  static const String idDataName = 'id';
  static const String knownForDepartmentDataName = 'known_for_department';
  static const String nameDataName = 'name';
  static const String originalNameDataName = 'original_name';
  static const String popularityDataName = 'popularity';
  static const String profilePathDataName = 'profile_path';
  static const String castIdDataName = 'cast_id';
  static const String characterDataName = 'character';
  static const String creditIdDataName = 'credit_id';
  static const String orderDataName = 'order';
  static const String departmentDataName = 'department';
  static const String jobDataName = 'job';
}
