import 'package:flutter/foundation.dart';

/// Controller class for managing home page state related to service types.
class HomeController {
  HomeController._(); // Private constructor

  static final HomeController _instance = HomeController._();

  factory HomeController() {
    return _instance;
  }

  /// List of available service types.
  List<String> serviceType = ["Equity", "Commodity", "Options"];

  /// ValueNotifier holding the currently selected service type.
  final ValueNotifier<String> selectedType = ValueNotifier("Options");

  /// Returns a string identifier based on the selected service type.
  ///
  /// This method is used to map each service type to a unique identifier.
  /// Returns:
  /// - "1" for "Commodity"
  /// - "2" for "Equity"
  /// - "3" for "Options"
  /// Defaults to "1" if the type is not recognized.
  String serviceChanger(String type) {
    switch (type) {
      case "Commodity":
        return "1";
      case "Options":
        return "3";
      case "Equity":
        return "2";
      default:
        return "1";
    }
  }
}
