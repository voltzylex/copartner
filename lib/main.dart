import 'package:copartner/common/theme.dart';
import 'package:copartner/home/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.defaultTheme,
      home: const Scaffold(
        body: HomePage(),
      ),
    );
  }
}
