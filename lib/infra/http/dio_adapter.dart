import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../data/errors/errors.dart';
import '../../data/http/http.dart';

class DioAdapter implements MyHttpClient {
  DioAdapter({required this.client});

  final Dio client;

  @override
  Future request({
    required String path,
    required RequestMethod method,
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> body = const {},
    Map<String, dynamic> headers = const {},
    CancelToken? cancelToken,
  }) async {
    const Map<String, dynamic> defaultHeaders = {'content-type': 'application/json', 'accept': 'application/json'};

    try {
      final response = await _getResponse(
        method: method,
        path: path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers.isNotEmpty ? headers : defaultHeaders,
          receiveDataWhenStatusError: true,
        ),
        body: body,
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } on DioException catch (error) {
      debugPrint(error.toString());
      throw _handleDioError(error);
    } on HttpError catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }

  Future<Response<dynamic>> _getResponse({
    required RequestMethod method,
    required String path,
    required Options? options,
    required Map<String, dynamic> queryParameters,
    required Map<String, dynamic> body,
    required CancelToken? cancelToken,
  }) async => switch (method) {
    RequestMethod.get => client.get(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    ),
    RequestMethod.put => client.put(
      path,
      data: body,
      options: options,
      cancelToken: cancelToken,
    ),
    RequestMethod.post => client.post(
      path,
      data: body,
      options: options,
      cancelToken: cancelToken,
    ),
    RequestMethod.patch => client.patch(
      path,
      data: body,
      options: options,
      cancelToken: cancelToken,
    ),
    RequestMethod.delete => client.delete(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    ),
  };

  Future<dynamic> _handleResponse(Response response) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      if (response.data is Map || response.data is List) {
        return response.data;
      }
      return {};
    }
    if (response.statusCode == 204) {
      return {};
    }
    throw _handleStatusCodeError(
      statusCode: response.statusCode,
      responseData: response.data,
    );
  }

  @override
  void close() => client.close(force: true);
}

HttpError _handleStatusCodeError({required int? statusCode, required dynamic responseData}) {
  late final String message;
  late final String detail;
  if (responseData is Map<String, dynamic>) {
    message = responseData['message'] ?? '';
    detail = responseData['detail'] ?? '';
  } else {
    message = '';
    detail = '';
  }
  return switch (statusCode) {
    400 => HttpError.badRequest(message: message, detail: detail),
    401 => HttpError.unauthorized(message: message, detail: detail),
    403 => HttpError.forbidden(message: message, detail: detail),
    404 => HttpError.notFound(message: message, detail: detail),
    422 => HttpError.invalidData(message: message, detail: detail),
    429 => HttpError.attemptsExceeded(message: message, detail: detail),
    _ => HttpError.serverError(message: message, detail: detail),
  };
}

HttpError _handleDioError(DioException error) => switch (error.type) {
  DioExceptionType.cancel => HttpError.unexpected(),
  DioExceptionType.sendTimeout => HttpError.noConnectionError(),
  DioExceptionType.receiveTimeout => HttpError.timeOut(),
  DioExceptionType.badResponse => HttpError.serverError(),
  _ => HttpError.noConnectionError(),
};
