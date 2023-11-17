import 'package:flutter_test/flutter_test.dart';

import 'package:compact_dio/compact_dio.dart';

void main() {
  test('adds one to input values', () async {
    const url = 'https://wyapi.vvxing.cn';
    final params = {'id': '120605500'};

    FlutterCompactDio.config
      ..setBaseUrl(url)
      ..setConnectTimeout(1000)
      ..create();
    final result = await CompactDio.asyncGet(
      '/digitalAlbum/detail',
      params: params,
      dialog: false,
      baseUrl: url,
    );
    expect(result.success, true);
  });
}
