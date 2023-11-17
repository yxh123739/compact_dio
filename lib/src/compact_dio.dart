import '../compact_dio.dart';

class CompactDio {
  static void get<R, T>(
    String path, {
    Map<String, dynamic>? params,
    String? baseUrl,
    bool? dialog,
    BaseDecoder? decoder,
    required Success<R> success,
    Fail? fail,
    T? decodeType,
  }) {
    return CompactDioProxy.instance.get<R, T>(
      path,
      success: success,
      fail: fail,
      params: params,
      baseUrl: baseUrl,
      dialog: dialog,
      decoder: decoder,
      type: decodeType,
    );
  }

  static Future<CompactDioResult<R>> asyncGet<R, T>(
    String path, {
    Map<String, dynamic>? params,
    String? baseUrl,
    bool? dialog,
    BaseDecoder? decoder,
    T? decodeType,
  }) {
    return CompactDioProxy.instance.asyncGet<R, T>(
      path,
      params: params,
      baseUrl: baseUrl,
      dialog: dialog,
      decoder: decoder,
      type: decodeType,
    );
  }

  static void post<R, T>(
    String path, {
    Map<String, dynamic>? params,
    String? baseUrl,
    bool? dialog,
    BaseDecoder? decoder,
    dynamic data,
    required Success<R> success,
    Fail? fail,
    T? decodeType,
  }) {
    return CompactDioProxy.instance.post<R, T>(
      path,
      success: success,
      fail: fail,
      params: params,
      baseUrl: baseUrl,
      dialog: dialog,
      decoder: decoder,
      data: data,
      type: decodeType,
    );
  }

  static Future<CompactDioResult<R>> asyncPost<R, T>(
    String path, {
    Map<String, dynamic>? params,
    String? baseUrl,
    bool? dialog,
    BaseDecoder? decoder,
    dynamic data,
    T? decodeType,
  }) {
    return CompactDioProxy.instance.asyncPost<R, T>(
      path,
      params: params,
      baseUrl: baseUrl,
      dialog: dialog,
      decoder: decoder,
      data: data,
      type: decodeType,
    );
  }

  static void put<R, T>(
    String path, {
    Map<String, dynamic>? params,
    String? baseUrl,
    bool? dialog,
    BaseDecoder? decoder,
    dynamic data,
    required Success<R> success,
    Fail? fail,
    T? decodeType,
  }) {
    return CompactDioProxy.instance.put<R, T>(
      path,
      success: success,
      fail: fail,
      params: params,
      baseUrl: baseUrl,
      dialog: dialog,
      decoder: decoder,
      data: data,
      type: decodeType,
    );
  }

  static Future<CompactDioResult<R>> asyncPut<R, T>(
    String path, {
    Map<String, dynamic>? params,
    String? baseUrl,
    bool? dialog,
    BaseDecoder? decoder,
    dynamic data,
    T? decodeType,
  }) {
    return CompactDioProxy.instance.asyncPut<R, T>(
      path,
      params: params,
      baseUrl: baseUrl,
      dialog: dialog,
      decoder: decoder,
      data: data,
      type: decodeType,
    );
  }

  static void delete<R, T>(
    String path, {
    Map<String, dynamic>? params,
    String? baseUrl,
    bool? dialog,
    BaseDecoder? decoder,
    required Success<R> success,
    Fail? fail,
    T? decodeType,
  }) {
    return CompactDioProxy.instance.delete<R, T>(
      path,
      success: success,
      fail: fail,
      params: params,
      baseUrl: baseUrl,
      dialog: dialog,
      decoder: decoder,
      type: decodeType,
    );
  }

  static Future<CompactDioResult<R>> asyncDelete<R, T>(
    String path, {
    Map<String, dynamic>? params,
    String? baseUrl,
    bool? dialog,
    BaseDecoder? decoder,
    T? decodeType,
  }) {
    return CompactDioProxy.instance.asyncDelete<R, T>(
      path,
      params: params,
      baseUrl: baseUrl,
      dialog: dialog,
      decoder: decoder,
      type: decodeType,
    );
  }
}
