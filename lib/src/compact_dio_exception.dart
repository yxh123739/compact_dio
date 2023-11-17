class CompactDioException implements Exception {
  final String? _message;
  final int? _statusCode;

  CompactDioException([this._statusCode,this._message]);

  String get message => _message ?? '请求错误';

  int get statusCode => _statusCode ?? -1;

  @override
  String toString() {
    return 'CompactDioException{message: $_message, statusCode: $_statusCode}';
  }
}
