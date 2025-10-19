import 'package:dio/dio.dart';

import 'http.dart';

abstract interface class MyHttpClient {
  Future<dynamic> request({
    required String path,
    required RequestMethod method,
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> body = const {},
    CancelToken? cancelToken,
  });

  void close();
}
