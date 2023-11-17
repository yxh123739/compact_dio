import 'package:compact_dio/src/typedefs.dart';

class CompactDioResult<T> {
  final T? _data;
  final int _errorCode;
  final String _errorMsg;
  final bool _success;

  CompactDioResult.success(this._data)
      : _errorCode = 0,
        _errorMsg = '',
        _success = true;

  CompactDioResult.error(this._errorCode, this._errorMsg)
      : _data = null,
        _success = false;

  void when({
    Success<T>? success,
    Fail? error,
  }) {
    if (_success) {
      success?.call(_data as T);
    } else {
      error?.call(_errorCode, _errorMsg);
    }
  }

  T? get data => _data;

  bool get success => _success;

  int get errorCode => _errorCode;

  String get errorMsg => _errorMsg;
}
