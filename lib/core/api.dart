import 'dart:convert';
import 'dart:developer';

import 'package:copartner/home/models/home_model.dart';
import 'package:dio/dio.dart';

/// Singleton class for handling API requests using Dio.
class Api {
  Api._(); // Private constructor for singleton pattern.

  static final Api _instance = Api._(); // Singleton instance.

  factory Api() =>
      _instance; // Factory method to access the singleton instance.
  static Api get to => _instance;
  final String stockUrl =
      "api/Subscription/GetByExpertsId/c541a503-d267-4652-ceb8-08dca55ffcba";

  final Dio dio = Dio(
    BaseOptions(
      baseUrl:
          "https://copartners.in/SubscriptionService/", // Base URL for API requests.
      // Additional options can be added here.
    ),
  )..interceptors.addAll(
      [
        LogInterceptor(
          responseBody: false,
          requestBody: false,
          logPrint: (object) {
            // Uncomment the line below to log Dio requests and responses.
            // log(object.toString(), name: "Dio");
          },
        ),
      ],
    );

  /// Fetches stock data asynchronously.
  /// Returns a [HomeModel] object on success or null on failure.
  Future<HomeModel?> fetchStockData() async {
    try {
      final Response response = await dio.get(stockUrl); // Perform GET request.
      if (response.statusCode == 200) {
        // Check if request was successful.
        return HomeModel.fromJson(
            response.data); // Parse JSON data into HomeModel object.
      } else {
        log('Failed to fetch data: ${response.statusCode}',
            name: 'Dio Error'); // Log error if status code is not 200.
        return null;
      }
    } on DioException catch (e) {
      log('Dio error: $e', name: 'Dio Error'); // Log DioError.
      return null;
    }
  }
}
