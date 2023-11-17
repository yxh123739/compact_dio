import 'package:dio/dio.dart';

class CompactDioConfig {
  Duration? connectTimeout;
  Duration? receiveTimeout;
  Duration? sendTimeout;
  List<Interceptor>? interceptors;
  String? baseUrl;
  Map<String, dynamic>? headers;

  CompactDioConfig();
}
