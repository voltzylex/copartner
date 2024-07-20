import 'dart:convert';
import 'dart:developer';

import 'package:copartner/home/models/home_model.dart';
import 'package:dio/dio.dart';

class Api {
  Api._();
  static final Api to = Api._();
  factory Api() {
    return to;
  }
  final String stockUrl =
      "api/Subscription/GetByExpertsId/c541a503-d267-4652-ceb8-08dca55ffcba";
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://copartners.in/SubscriptionService/",
      // validateStatus: (status) {
      // },
    ),
  )..interceptors.addAll(
      [
        LogInterceptor(
          responseBody: false,
          requestBody: false,
          logPrint: (object) {
            // log(object.toString(), name: "Dio");
          },
        ),
      ],
    );
  Future<HomeModel?> fetchStockData() async {
    try {
      final res = await dio.get(stockUrl);
      log("Api data 1 is ${res.data}");
      final home = homeModelFromJson(jsonEncode(res.data));
      log("Api data is ${home.isSuccess}");
      return home;
    } on DioException catch (e) {
      log(e.toString(), name: "Dio Error");
      return null;
    }
  }
}
