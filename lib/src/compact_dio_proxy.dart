import 'package:compact_dio/compact_dio.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class CompactDioProxy {
  static CompactDioProxy? _instance;

  static CompactDioProxy get instance =>
      _instance ??= CompactDioProxy._internal();

  CompactDioProxy._internal();

  final _config = CompactDioConfig();

  CompactDioRequest? _request;

  bool _enableLog = true;

  BaseDecoder _decoder = ResultDecoder.instance;

  bool _loading = false;

  void enableLoading(bool loading) => _loading = loading;

  void enableLog(bool enable) => _enableLog = enable;

  void setDefaultDecoder(BaseDecoder decoder) => _decoder = decoder;

  void setBaseUrl(String url) => _config.baseUrl = url;

  void setConnectTimeout(int timeout) {
    _config.connectTimeout = Duration(milliseconds: timeout);
  }

  void setReceiveTimeout(int timeout) {
    _config.receiveTimeout = Duration(milliseconds: timeout);
  }

  void setSendTimeout(int timeout) {
    _config.sendTimeout = Duration(milliseconds: timeout);
  }

  setHeaders(Map<String, dynamic> headers) => _config.headers = headers;

  void addInterceptor(Interceptor interceptor) {
    _config.interceptors ??= [] as Interceptors?;
    _config.interceptors?.add(interceptor);
  }

  void create() {
    if (_enableLog) {
      _config.interceptors ??= <Interceptor>[];
      final loggerInterceptor = PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      );
      _config.interceptors!.add(loggerInterceptor);
    }
    _request = CompactDioRequest(
      config: _config,
      decoder: _decoder,
    );
  }

  void get<R, T>(
    String path, {
    Map<String, dynamic>? params,
    String? baseUrl,
    bool? dialog,
    BaseDecoder? decoder,
    required Success<R> success,
    Fail? fail,
    T? type,
  }) async {
    final result = await _sendRequest<R, T>(
      Method.GET,
      path,
      params: params,
      baseUrl: baseUrl,
      decoder: decoder,
      dialog: dialog,
      type: type,
    );
    result.when(success: success, error: fail);
  }

  Future<CompactDioResult<R>> asyncGet<R, T>(
    String path, {
    Map<String, dynamic>? params,
    String? baseUrl,
    bool? dialog,
    BaseDecoder? decoder,
    T? type,
  }) async {
    return _sendRequest<R, T>(
      Method.GET,
      path,
      params: params,
      baseUrl: baseUrl,
      decoder: decoder,
      dialog: dialog,
      type: type,
    );
  }

  void post<R, T>(
    String path, {
    Map<String, dynamic>? params,
    String? baseUrl,
    bool? dialog,
    BaseDecoder? decoder,
    dynamic data,
    required Success<R> success,
    Fail? fail,
    T? type,
  }) async {
    final result = await _sendRequest<R, T>(
      Method.POST,
      path,
      params: params,
      baseUrl: baseUrl,
      decoder: decoder,
      data: data,
      dialog: dialog,
      type: type,
    );
    result.when(success: success, error: fail);
  }

  Future<CompactDioResult<R>> asyncPost<R, T>(
    String path, {
    Map<String, dynamic>? params,
    String? baseUrl,
    bool? dialog,
    BaseDecoder? decoder,
    dynamic data,
    T? type,
  }) async {
    return _sendRequest<R, T>(
      Method.POST,
      path,
      params: params,
      baseUrl: baseUrl,
      decoder: decoder,
      data: data,
      dialog: dialog,
      type: type,
    );
  }

  void delete<R, T>(
    String path, {
    Map<String, dynamic>? params,
    String? baseUrl,
    bool? dialog,
    BaseDecoder? decoder,
    dynamic data,
    required Success<R> success,
    Fail? fail,
    T? type,
  }) async {
    final result = await _sendRequest<R, T>(
      Method.DELETE,
      path,
      params: params,
      baseUrl: baseUrl,
      decoder: decoder,
      data: data,
      dialog: dialog,
      type: type,
    );
    result.when(success: success, error: fail);
  }

  Future<CompactDioResult<R>> asyncDelete<R, T>(
    String path, {
    Map<String, dynamic>? params,
    String? baseUrl,
    bool? dialog,
    BaseDecoder? decoder,
    dynamic data,
    T? type,
  }) async {
    return _sendRequest<R, T>(
      Method.DELETE,
      path,
      params: params,
      baseUrl: baseUrl,
      decoder: decoder,
      data: data,
      dialog: dialog,
      type: type,
    );
  }

  void put<R, T>(
    String path, {
    Map<String, dynamic>? params,
    String? baseUrl,
    bool? dialog,
    BaseDecoder? decoder,
    dynamic data,
    required Success<R> success,
    Fail? fail,
    T? type,
  }) async {
    final result = await _sendRequest<R, T>(
      Method.PUT,
      path,
      params: params,
      baseUrl: baseUrl,
      decoder: decoder,
      data: data,
      dialog: dialog,
      type: type,
    );
    result.when(success: success, error: fail);
  }

  Future<CompactDioResult<R>> asyncPut<R, T>(
    String path, {
    Map<String, dynamic>? params,
    String? baseUrl,
    bool? dialog,
    BaseDecoder? decoder,
    dynamic data,
    T? type,
  }) async {
    return _sendRequest<R, T>(
      Method.PUT,
      path,
      params: params,
      baseUrl: baseUrl,
      decoder: decoder,
      data: data,
      dialog: dialog,
      type: type,
    );
  }

  Future<CompactDioResult<R>> _sendRequest<R, T>(
    Method method,
    String path, {
    Map<String, dynamic>? params,
    String? baseUrl,
    bool? dialog,
    BaseDecoder? decoder,
    dynamic data,
    T? type,
  }) async {
    _loading = dialog ?? _loading;
    if (_loading) {
      SmartDialog.showLoading();
    }
    if (_request == null) create();
    final result = await _request!.request<R, T>(
      method,
      path,
      params: params,
      baseUrl: baseUrl,
      decoder: decoder,
      data: data,
      type: type,
    );
    if (_loading) {
      SmartDialog.dismiss();
    }
    return result;
  }
}
