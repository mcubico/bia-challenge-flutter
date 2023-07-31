import 'dart:convert';

import '../models.dart';

class ComicDataWrapperModel extends DataWrapperBaseModel {
  ComicDataWrapperModel({
    super.code,
    super.status,
    super.copyright,
    super.attributionText,
    super.attributionHtml,
    super.etag,
    this.data,
  });

  factory ComicDataWrapperModel.fromJson(String data) =>
      ComicDataWrapperModel.fromMap(jsonDecode(data));

  factory ComicDataWrapperModel.fromMap(Map<String, dynamic> jsonData) =>
      ComicDataWrapperModel(
        code: jsonData[DataWrapperBaseModel.codeDataName],
        status: jsonData[DataWrapperBaseModel.statusDataName],
        copyright: jsonData[DataWrapperBaseModel.copyrightDataName],
        attributionText: jsonData[DataWrapperBaseModel.attributionTextDataName],
        attributionHtml: jsonData[DataWrapperBaseModel.attributionHtmlDataName],
        etag: jsonData[DataWrapperBaseModel.etagDataName],
        data: ComicDataContainerModel.fromMap(
          jsonData[DataWrapperBaseModel.dataDataName],
        ),
      );

  @override
  // ignore: overridden_fields
  final ComicDataContainerModel? data;
}
