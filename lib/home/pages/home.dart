import 'package:copartner/common/assets.dart';
import 'package:copartner/common/constants.dart';
import 'package:copartner/home/pages/widgets/body.dart';
import 'package:copartner/home/pages/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.background,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: HomeAppBar(),
        body: BodyWidget(),
      ),
    );
  }
}
