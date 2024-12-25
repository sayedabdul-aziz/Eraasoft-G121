import 'package:bookia_app/core/constants/constants.dart';
import 'package:dio/dio.dart';

class DioProvider {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));
  }

  static Future<Response> get(
      {required String endpoint, Map<String, dynamic>? headers}) {
    return dio.get(endpoint,
        options: Options(
          headers: headers,
        ));
  }

  static Future<Response> post({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.post(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  static Future<Response> put(
      {required String endpoint, Object? data, Map<String, dynamic>? headers}) {
    return dio.put(endpoint, data: data, options: Options(headers: headers));
  }

  static Future<Response> delete(
      {required String endpoint, Map<String, dynamic>? headers}) {
    return dio.delete(endpoint, options: Options(headers: headers));
  }
}
