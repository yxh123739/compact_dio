import 'package:dio/dio.dart';

class NetExceptionType {
  static const String connectTimeout = '连接超时';
  static const String sendTimeout = '请求超时';
  static const String receiveTimeout = '响应超时';
  static const String cancel = '取消请求';
  static const String badResponse = '服务器异常';
  static const String connectionError = ' 远程计算机拒绝网络连接';
  static const String unknown = '未知错误';
}

class ExceptionHandler {
  static String handleException(DioException exception) {
    String message = '未知错误';
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        message = NetExceptionType.connectTimeout;
        break;
      case DioExceptionType.sendTimeout:
        message = NetExceptionType.sendTimeout;
        break;
      case DioExceptionType.receiveTimeout:
        message = NetExceptionType.receiveTimeout;
        break;
      case DioExceptionType.badResponse:
        message = NetExceptionType.badResponse;
        break;
      case DioExceptionType.badCertificate:
        break;
      case DioExceptionType.cancel:
        message = NetExceptionType.cancel;
        break;
      case DioExceptionType.connectionError:
        message = NetExceptionType.connectionError;
        break;
      case DioExceptionType.unknown:
        message = NetExceptionType.unknown;
        break;
    }
    return message;
  }
}
