import 'package:flutter/foundation.dart';

class HomeController {
  HomeController._(); // Private constructor

  static final HomeController _instance = HomeController._();

  factory HomeController() {
    return _instance;
  }

   List<String> serviceType = ["Equity", "Commodity", "Options"];
  final ValueNotifier<int> selectedType = ValueNotifier(0);
}
