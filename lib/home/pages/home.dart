import 'package:flutter/material.dart';

import 'package:copartner/common/assets.dart';

import 'package:copartner/home/pages/widgets/body.dart';
import 'package:copartner/home/pages/widgets/home_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      // Applying a background image decoration
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.background,  // Using a custom background image from Assets class
          ),
          fit: BoxFit.cover,  // Covering the entire screen with the background image
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,  // Making the Scaffold background transparent
        appBar: HomeAppBar(),  // Setting the custom HomeAppBar widget as the app bar
        body: BodyWidget(),  // Setting the custom BodyWidget as the body of the Scaffold
      ),
    );
  }
}
