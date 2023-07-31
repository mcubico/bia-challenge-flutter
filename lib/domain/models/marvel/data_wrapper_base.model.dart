import 'dart:convert';

class DataWrapperBaseModel {
  DataWrapperBaseModel({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() => {
        DataWrapperBaseModel.codeDataName: code,
        DataWrapperBaseModel.statusDataName: status,
        DataWrapperBaseModel.copyrightDataName: copyright,
        DataWrapperBaseModel.attributionTextDataName: attributionText,
        DataWrapperBaseModel.attributionHtmlDataName: attributionHtml,
        DataWrapperBaseModel.etagDataName: etag,
        DataWrapperBaseModel.dataDataName: data?.toMap(),
      };

  final int? code;
  final String? status;
  final String? copyright;
  final String? attributionText;
  final String? attributionHtml;
  final String? etag;
  final dynamic data;

  static String codeDataName = 'code';
  static String statusDataName = 'status';
  static String copyrightDataName = 'copyright';
  static String attributionTextDataName = 'attributionText';
  static String attributionHtmlDataName = 'attributionHtml';
  static String etagDataName = 'etag';
  static String dataDataName = 'data';
}
