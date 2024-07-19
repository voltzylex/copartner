import 'package:dio/dio.dart';

class Api {
  Api._();
  static final Api to = Api._();
  factory Api() {
    return to;
  }

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      // validateStatus: (status) {
      // },
    ),
  )..interceptors.addAll([
      LogInterceptor(
        responseBody: true,
        requestBody: true,
      ),
    ]);
}
