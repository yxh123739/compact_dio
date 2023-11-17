import 'package:compact_dio/src/base_decoder.dart';
import 'package:compact_dio/src/base_model.dart';
import 'package:dio/dio.dart';

class ResultDecoder implements BaseDecoder {
  static ResultDecoder? _decoder;

  ResultDecoder._();

  static get instance => _decoder ??= ResultDecoder._();

  @override
  R decode<R, T>({required Response<dynamic> response, T? type}) {
    if (type is BaseModel) {
      if (response.data is List) {
        final dataList = response.data as List;
        final newDataList = dataList.map((e) => type.fromJson(e)).toList();
        return List<T>.from(newDataList) as R;
      } else {
        return type.fromJson(response.data) as R;
      }
    } else {
      return response.data as R;
    }
  }
}
