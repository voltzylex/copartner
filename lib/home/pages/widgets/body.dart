import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:copartner/common/appcolors.dart';
import 'package:copartner/common/constants.dart';
import 'package:copartner/common/extension.dart';
import 'package:copartner/common/theme.dart';
import 'package:copartner/core/api.dart';
import 'package:copartner/home/controllers/home_controller.dart';
import 'package:copartner/home/models/home_model.dart';

/// BodyWidget represents the main body content of the home page.
class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: FutureBuilder(
          future: Api.to.fetchStockData(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snap.hasData) {
              final home = HomeController();

              return ValueListenableBuilder(
                valueListenable: home.selectedType,
                builder: (context, v, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Subscription",
                        style: context.theme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                      // Display carousel widgets based on fetched data
                      ...snap.data!.data!.map(
                        (item) => item.serviceType == home.serviceChanger(v)
                            ? carousalWidget(context, itemcount: 5, data: item)
                            : const SizedBox(),
                      ),
                    ],
                  );
                },
              );
            }

            // Show error message and refresh button on error
            return InkWell(
              onTap: () {
                setState(() {});
              },
              child: Column(
                children: [
                  const Text(
                    "Some Error Occurred \n Please Try Again",
                    textAlign: TextAlign.center,
                  ),
                  10.h,
                  const Icon(
                    Icons.refresh_sharp,
                    color: AppColors.white,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /// Generates a carousel widget to display subscription details.
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
      margin: const EdgeInsets.only(top: 5, bottom: defaultPadding),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: const Color(0xff1D242D).withOpacity(.5),
        border: Border.all(color: AppColors.white.withOpacity(.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Expert details ListTile
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            leading: CircleAvatar(
              backgroundColor: const Color(0xffE9E9E9),
              radius: 20,
              child: ClipOval(
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
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.verified_rounded,
                      color: AppColors.blue,
                    ),
                    Text(
                      "SEBI Reg.",
                      style: TextStyle(color: AppColors.blue),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Carousel for subscription details
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

          // Indicator dots for the carousel
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
                },
              ),
              separatorBuilder: (context, index) => 10.w,
            ),
          ),
          10.h,
        ],
      ),
    );
  }
}
