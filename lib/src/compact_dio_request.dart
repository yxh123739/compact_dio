import 'package:compact_dio/src/base_decoder.dart';
import 'package:compact_dio/src/compact_dio_config.dart';
import 'package:compact_dio/src/compact_dio_exception.dart';
import 'package:compact_dio/src/exception_handler.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'compact_dio_result.dart';


class CompactDioRequest {
  final CompactDioConfig config;
  final BaseDecoder decoder;

  Dio? _dio;

  CompactDioRequest({
    required this.config,
    required this.decoder,
  }) {
    _dio = _createDio();
  }

  Dio _createDio() {
    final option = BaseOptions(
      baseUrl: config.baseUrl ?? '',
      connectTimeout: config.connectTimeout,
      receiveTimeout: config.receiveTimeout,
      sendTimeout: config.sendTimeout,
      headers: config.headers,
    );
    final dio = Dio(option);

    if (config.interceptors != null && config.interceptors!.isNotEmpty) {
      dio.interceptors.addAll(config.interceptors!);
    }
    return dio;
  }

  Future<CompactDioResult<R>> request<R, T>(
    Method method,
    String path, {
    Map<String, dynamic>? params,
    dynamic data,
    String? baseUrl,
    BaseDecoder? decoder,
    T? type,
  }) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        return CompactDioResult.error(
          -1,
          '无法连接网络,请检查网络设置',
        );
      }
      if (baseUrl != null) _dio!.options.baseUrl = baseUrl;
      Response response = await _dio!.request(
        path,
        queryParameters: params,
        data: data,
        options: Options(
          method: _methodValues[method],
          sendTimeout: const Duration(milliseconds: 2000),
        ),
      );
      decoder ??= this.decoder;
      final result = decoder.decode(response: response, type: type);
      return CompactDioResult.success(result);
    } on DioException catch (e) {
      final message = ExceptionHandler.handleException(e);
      return CompactDioResult.error(
        e.response?.statusCode ?? -1,
        message,
      );
    } on CompactDioException catch (e) {
      return CompactDioResult.error(
        e.statusCode,
        e.message,
      );
    }
  }
}

enum Method { GET, POST, DELETE, PUT }

const _methodValues = {
  Method.GET: "get",
  Method.POST: "post",
  Method.DELETE: "delete",
  Method.PUT: "put",
};
