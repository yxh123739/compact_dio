import 'package:compact_dio/compact_dio.dart';
import 'package:dio/dio.dart';

class FlutterCompactDio {
  static FlutterCompactDio? _instance;

  static FlutterCompactDio get config => _instance ??= FlutterCompactDio._();

  FlutterCompactDio._();

  void enableLoading(bool loading) =>
      CompactDioProxy.instance.enableLoading(loading);

  void enableLog(bool enable) => CompactDioProxy.instance.enableLog(enable);

  void setDefaultDecoder(BaseDecoder decoder) =>
      CompactDioProxy.instance.setDefaultDecoder(decoder);

  void setBaseUrl(String url) => CompactDioProxy.instance.setBaseUrl(url);

  void setConnectTimeout(int timeout) =>
      CompactDioProxy.instance.setConnectTimeout(timeout);

  void setReceiveTimeout(int timeout) =>
      CompactDioProxy.instance.setReceiveTimeout(timeout);

  void setSendTimeout(int timeout) =>
      CompactDioProxy.instance.setSendTimeout(timeout);

  void setHeaders(Map<String, dynamic> headers) =>
      CompactDioProxy.instance.setHeaders(headers);

  void addInterceptor(Interceptor interceptor) =>
      CompactDioProxy.instance.addInterceptor(interceptor);

  void create() => CompactDioProxy.instance.create();
}
