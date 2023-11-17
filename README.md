## 自用http网络请求库，基于dio封装

## 使用方法
### 全局配置
```dart
FlutterCompactDio.config
      ..setBaseUrl(url)
      ..setConnectTimeout(1000)
      ···
      ..create();
```
## 请求
 不同的人有不同的编码风格，于是提供了两种请求方式，分别以`get`和`asyncGet`类似,
 带有`async`的方法返回的是`Future`对象，不带的是`void`，
 通过`success`和`fail`回调来处理请求结果

### 回调的get请求
```dart
CompactDio.get<TestModel, TestModel>(
      '/digitalAlbum/detail',
      params: params,
      dialog: true,
      decodeType: TestModel(),
      success: (data) {
        print(data);
      },
      fail: (code, message) {
        print('$code $message');
      },
    );
```
### 异步的get请求
```dart
final result = await CompactDio.asyncGet<TestModel, TestModel>(
      '/digitalAlbum/detail',
      params: params,
      dialog: true,
      baseUrl: url,
      decodeType: TestModel(),
    );
if (result.success) {
     print(result.data);
} else {
     print('${result.errorCode} ${result.errorMsg}');
}
```
在请求的泛型当中，前一个泛型是你期望拿到的结果，而后一个泛型是解析的模型类，
该类需要继承`BaseModel`，并且实现`fromJson`方法，大多数时候可以省略不写，传入`decodeType`参数即可
如果你期望拿到的结果是一个列表，那么你需要传入`List`类型的泛型，例如`List<TestModel>`，和上面的用法一样
不传入type参数则返回原始数据
```dart
import 'package:compact_dio/compact_dio.dart';

class TestModel extends BaseModel {
  late int code;
  late bool hasAlbum;

  TestModel();

  TestModel.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        hasAlbum = json['hasAlbum'];

  @override
  TestModel fromJson(Map<String, dynamic> json) {
    return TestModel.fromJson(json);
  }

  @override
  String toString() {
    return 'code: $code, hasAlbum: $hasAlbum';
  }
}
```
如果你的接口返回的数据是规范的，那么你只需要继承`BaseDecoder`，并且实现`decode`方法，即可自定义解析方法
可以全局配置解析器，也可以为每一个请求设置单独的解析器，传入`decoder`参数即可
```dart
import 'package:compact_dio/src/base_decoder.dart';
import 'package:compact_dio/src/base_model.dart';
import 'package:dio/dio.dart';

class ResultDecoder implements BaseDecoder {
  static ResultDecoder? _decoder;

  ResultDecoder._();

  static get instance => _decoder ??= ResultDecoder._();

  @override
  R decode<R, T>({required Response<dynamic> response, T? type}) {
    if (type is BaseModel) {
      if (response.data is List) {
        final dataList = response.data as List;
        final newDataList = dataList.map((e) => type.fromJson(e)).toList();
        return List<T>.from(newDataList) as R;
      } else {
        return type.fromJson(response.data) as R;
      }
    } else {
      return response.data as R;
    }
  }
}
```
### 注意，该库使用了`flutter_smart_dialog`来显示加载框，如果你需要使用加载框，需要在`main.dart`中初始化
```dart
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      builder: FlutterSmartDialog.init(),
    );
  }
```
也可以自定义加载框，传入`dialogBuilder`参数即可，更多的参数可以查看其官方文档
