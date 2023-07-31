import 'dart:convert';

import '../models.dart';

class CharacterDataWrapperModel extends DataWrapperBaseModel {
  CharacterDataWrapperModel({
    super.code,
    super.status,
    super.copyright,
    super.attributionText,
    super.attributionHtml,
    super.etag,
    this.data,
  });

  factory CharacterDataWrapperModel.fromJson(String data) =>
      CharacterDataWrapperModel.fromMap(jsonDecode(data));

  factory CharacterDataWrapperModel.fromMap(Map<String, dynamic> jsonData) =>
      CharacterDataWrapperModel(
        code: jsonData[DataWrapperBaseModel.codeDataName],
        status: jsonData[DataWrapperBaseModel.statusDataName],
        copyright: jsonData[DataWrapperBaseModel.copyrightDataName],
        attributionText: jsonData[DataWrapperBaseModel.attributionTextDataName],
        attributionHtml: jsonData[DataWrapperBaseModel.attributionHtmlDataName],
        etag: jsonData[DataWrapperBaseModel.etagDataName],
        data: CharacterDataContainerModel.fromMap(
          jsonData[DataWrapperBaseModel.dataDataName],
        ),
      );

  @override
  // ignore: overridden_fields
  final CharacterDataContainerModel? data;
}
