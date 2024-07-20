import 'dart:developer';

import 'package:copartner/common/appcolors.dart';
import 'package:copartner/common/constants.dart';
import 'package:copartner/common/extension.dart';
import 'package:copartner/common/theme.dart';
import 'package:copartner/core/api.dart';
import 'package:copartner/home/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                // if (snap.connectionState == ConnectionState.waiting) {
                //   return const Center(
                //     child: CircularProgressIndicator(),
                //   );
                // }
                if (snap.data != null) {
                  return Column(
                    children: snap.data!.data!
                        .map(
                          (item) => item.serviceType == "1"
                              ? carousalWidget(context,
                                  itemcount: 5, data: item)
                              : SizedBox(),
                        )
                        .toList(),
                  );
                }

                return const Text("Some Error Occured");
              }),
        ],
      ),
    );
  }

  Container carousalWidget(BuildContext context,
      {required int itemcount, required Datum data}) {
    final ValueNotifier<int> vIndex = ValueNotifier<int>(0);
    final subtitleTheme = context.theme.bodySmall
        ?.copyWith(fontSize: 10, color: AppColors.white.withOpacity(.5));
    final titleTheme = context.theme.bodyLarge?.copyWith(fontSize: 14);
    final image = data.experts!.expertImagePath!;
    final channelName = data.experts!.channelName!;
    final expertName = data.experts!.name!;
    final planType = data.planType!;
    final time = DateFormat('h:mm a').format(data.updatedOn!);

    final amount = data.amount!;
    final duration = data.durationMonth;
    final discount = data.discountPercentage;

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
            leading: CircleAvatar(
              radius: 20,
              child: Center(
                child: Image.network(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            title: Text(
              channelName,
              style: context.theme.bodySmall
                  ?.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              expertName,
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
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xff1D242D).withOpacity(.31),
                  borderRadius: BorderRadius.circular(radius),
                  border: Border.all(
                    color: Colors.white.withOpacity(.10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          planType,
                          style: titleTheme,
                        ),
                        Container(
                          transform: Matrix4.translationValues(-10, -5, 0),
                          child: Text(
                            time.toString(),
                            style: subtitleTheme,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Amount :", style: subtitleTheme),
                        5.w,
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(.1),
                            borderRadius: BorderRadius.circular(radius + 10),
                          ),
                          child: Text(
                            amount.toInt().toString(),
                            style: titleTheme?.copyWith(fontSize: 12),
                          ).padding(const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Duration :", style: subtitleTheme),
                        5.w,
                        Text("${duration!.toInt()}Month", style: titleTheme),
                        defaultPadding.w,
                        Text("Discount :", style: subtitleTheme),
                        5.w,
                        Text("${discount ?? 30}%", style: titleTheme),
                      ],
                    ),
                  ],
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
