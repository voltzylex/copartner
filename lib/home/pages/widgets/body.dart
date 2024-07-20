import 'dart:developer';

import 'package:copartner/common/appcolors.dart';
import 'package:copartner/common/constants.dart';
import 'package:copartner/common/extension.dart';
import 'package:copartner/common/theme.dart';
import 'package:copartner/core/api.dart';
import 'package:flutter/material.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
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
          FutureBuilder(
              future: Api.to.fetchStockData(),
              builder: (context, snap) {
                log("Snapdata is ${snap.hasData} and state is ${snap.connectionState} and data is ${snap.data?.isSuccess}");
                if (snap.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snap.data != null) {
                  return Column(
                    children: snap.data!.data!
                        .map((item) => carousalWidget(context, itemcount: 5))
                        .toList(),
                  );
                }

                return Text("Some Error Occured");
              }),
        ],
      ),
    );
  }

  Container carousalWidget(BuildContext context, {required int itemcount}) {
    final ValueNotifier<int> vIndex = ValueNotifier<int>(0);
    return Container(
      // height: 211,
      margin: const EdgeInsets.only(top: 5, bottom: defaultPadding),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: const Color(0xff1D242D).withOpacity(.5),
          border: Border.all(color: AppColors.white.withOpacity(.1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            leading: const CircleAvatar(
              radius: 20,
              child: Icon(Icons.person),
            ),
            title: Text(
              "Channel Name",
              style: context.theme.bodySmall
                  ?.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Expert Name",
              style: context.theme.bodySmall
                  ?.copyWith(color: AppColors.white.withOpacity(.5)),
            ),
            trailing: Column(
              children: [
                5.h,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.verified_rounded,
                      color: AppColors.blue,
                    ),
                    Text(
                      "SEBI Reg.",
                      style: context.theme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 125,
            child: PageView.builder(
              controller: PageController(viewportFraction: .9),
              onPageChanged: (value) => vIndex.value = value,
              itemCount: itemcount,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xff1D242D).withOpacity(.31),
                  borderRadius: BorderRadius.circular(radius),
                  border: Border.all(
                    color: Colors.white.withOpacity(.10),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
            child: ListView.separated(
              itemCount: itemcount,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ValueListenableBuilder(
                  valueListenable: vIndex,
                  builder: (context, val, _) {
                    return AnimatedContainer(
                      duration: Durations.long2,
                      height: 5,
                      width: val == index ? 30 : 10,
                      decoration: BoxDecoration(
                        color: val == index
                            ? AppColors.white
                            : AppColors.white.withOpacity(.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  }),
              separatorBuilder: (context, index) => 10.w,
            ),
          ),
          10.h,
        ],
      ),
    );
  }
}
