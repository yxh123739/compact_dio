import 'package:compact_dio/compact_dio.dart';

class TestModel extends BaseModel {
  late int code;
  late bool hasAlbum;

  TestModel();

  TestModel.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        hasAlbum = json['hasAlbum'];

  @override
  TestModel fromJson(Map<String, dynamic> json) {
    return TestModel.fromJson(json);
  }

  @override
  String toString() {
    return 'code: $code, hasAlbum: $hasAlbum';
  }
}
