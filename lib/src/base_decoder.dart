import 'package:dio/dio.dart';

abstract class BaseDecoder {
  R decode<R, T>({required Response response, T? type});
}
