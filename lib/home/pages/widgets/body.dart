import 'package:copartner/common/appcolors.dart';
import 'package:copartner/common/constants.dart';
import 'package:copartner/common/extension.dart';
import 'package:copartner/common/theme.dart';
import 'package:flutter/material.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Subscription",
            style:
                context.theme.bodyLarge?.copyWith(fontWeight: FontWeight.w400),
          ),
          carousalWidget(context),
          carousalWidget(context),
          carousalWidget(context),
        ],
      ),
    );
  }

  Container carousalWidget(BuildContext context) {
    final ValueNotifier<int> value = ValueNotifier<int>(0);
    return Container(
      height: 211,
      margin: const EdgeInsets.only(top: 5, bottom: defaultPadding),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: const Color(0xff1D242D).withOpacity(.29)
          // gradient: LinearGradient(colors: [
          //   const Color(0xff1D242D).withOpacity(.29),
          //   const Color(0xff1D242D).withOpacity(.29)
          // ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ListTile(),
          Container(
            height: 115,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color(0xff1D242D).withOpacity(.31),
                borderRadius: BorderRadius.circular(radius),
                border: Border.all(color: Colors.white.withOpacity(.10))),
          ),
          SizedBox(
            height: 5,
            child: ListView.separated(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ValueListenableBuilder(
                  valueListenable: value,
                  builder: (context, val, _) {
                    return AnimatedContainer(
                      duration: Durations.extralong1,
                      height: 5,
                      width: val == index ? 30 : 10,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  }),
              separatorBuilder: (context, index) => 10.w,
            ),
          ),
        ],
      ),
    );
  }
}
