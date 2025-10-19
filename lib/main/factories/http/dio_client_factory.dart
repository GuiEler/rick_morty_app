import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';

import '../../../data/http/http.dart';
import '../../../infra/http/http.dart';

const String _baseUrl = 'https://rickandmortyapi.com/api/';
const Duration _defaultTimeout = Duration(milliseconds: 25000);
final BaseOptions _baseOptions = BaseOptions(
  baseUrl: _baseUrl,
  followRedirects: true,
  validateStatus: (status) => status != null,
  connectTimeout: _defaultTimeout,
  receiveTimeout: _defaultTimeout,
  sendTimeout: _defaultTimeout,
);

Dio _createClient() {
  final Dio client = Dio(_baseOptions);
  client.interceptors.add(
    PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
      canShowLog: kDebugMode,
    ),
  );
  return client;
}

MyHttpClient makeDioAdapter() {
  final client = _createClient();
  return DioAdapter(client: client);
}
