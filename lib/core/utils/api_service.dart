import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retry/retry.dart';

import 'cach_maneger.dart';
import 'end_points.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio) {
    _dio.options.connectTimeout = const Duration(seconds: 20);
    _dio.options.receiveTimeout = const Duration(seconds: 20);
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: true,
      logPrint: (object) => log(object.toString()),
    ));
  }

  Future<Map<String, dynamic>> _retryRequest(
      Future<Response> Function() request) async {
    const r = RetryOptions(maxAttempts: 3);
    return await r.retry(
      () async {
        final response = await request();
        return response.data;
      },
      retryIf: (e) => e is DioException,
    );
  }

  Future<Map<String, dynamic>> get(
      {required String endPoint,
      dynamic data,
      bool? needBaseUrl,
      bool? needToken,
      String? languageCode,
      Map<String, dynamic>? queryParameters}) async {
    _dio.options.headers['content-Type'] = 'multipart/form-data';
    _dio.options.headers['Accept'] = 'application/json';
    if (needToken ?? false) {
      _dio.options.headers['Authorization'] =
          'Bearer ${await CacheManager.getAccessToken()}';
    }
    // _dio.options.headers['lang'] = await CacheManager.getLanguageCode() ??'ar';

    final url = needBaseUrl ?? true ? EndPoints.baseUrl + endPoint : endPoint;

    return await _retryRequest(
        () => _dio.get(url, data: data, queryParameters: queryParameters));
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint,
      dynamic data,
      bool? needBaseUrl,
      bool? needToken,
      bool? haveFile,
      String? languageCode,
      Function(int, int)? onSendProgress,
      Map<String, dynamic>? queryParameters}) async {
    haveFile ?? false
        ? _dio.options.headers['content-Type'] = 'multipart/form-data'
        : _dio.options.headers['content-Type'] = 'application/json';

    _dio.options.headers['Accept'] = 'application/json';
    if (needToken ?? false) {
      _dio.options.headers['Authorization'] =
          'Bearer ${await CacheManager.getAccessToken()}';
    }

    _dio.options.headers['lang'] = await CacheManager.getLanguageCode();

    final url = needBaseUrl ?? true ? EndPoints.baseUrl + endPoint : endPoint;

    final response = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      onSendProgress: onSendProgress,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> delete(
      {required String endPoint,
      dynamic data,
      bool? needBaseUrl,
      String? languageCode,
      bool? needToken}) async {
    _dio.options.headers['content-Type'] = 'application/json';
    _dio.options.headers['Accept'] = 'application/json';
    if (needToken ?? false) {
      _dio.options.headers['Authorization'] =
          'Bearer ${await CacheManager.getAccessToken()}';
    }

    _dio.options.headers['lang'] = await CacheManager.getLanguageCode();

    final url = needBaseUrl ?? true ? EndPoints.baseUrl + endPoint : endPoint;

    return await _dio.delete(url, data: data).then((value) => value.data);
  }

  Future<Map<String, dynamic>> put(
      {required String endPoint,
      dynamic data,
      bool? needBaseUrl,
      bool? needToken,
      String? languageCode,
      Function(int, int)? onSendProgress}) async {
    _dio.options.headers['content-Type'] = 'application/json';
    _dio.options.headers['Accept'] = 'application/json';
    if (needToken ?? false) {
      _dio.options.headers['Authorization'] =
          'Bearer ${await CacheManager.getAccessToken()}';
    }

    _dio.options.headers['lang'] = await CacheManager.getLanguageCode();

    final url = needBaseUrl ?? true ? EndPoints.baseUrl + endPoint : endPoint;

    return await _dio
        .put(url, data: data, onSendProgress: onSendProgress)
        .then((value) => value.data);
  }
}
