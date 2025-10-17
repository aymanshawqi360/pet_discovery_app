import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static Dio? dio;

  static initDio() {
    final time = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = time
        ..options.receiveTimeout = time;

      dioInterceptors();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void dioInterceptors() {
    // dio?.interceptors.add(
    //   PrettyDioLogger(
    //     request: true,
    //     error: true,
    //     requestBody: true,
    //     requestHeader: true,
    //     responseBody: true,
    //     responseHeader: true,
    //   ),
    // );
    dio?.interceptors.addAll([
      PrettyDioLogger(
        request: true,
        error: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
      // ApiInterceptorsWrapper(dio: dio!),
    ]);
  }
}
