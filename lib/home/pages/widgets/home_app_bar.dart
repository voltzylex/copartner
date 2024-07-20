import 'dart:developer';

import 'package:copartner/common/appcolors.dart';
import 'package:copartner/common/assets.dart';
import 'package:copartner/common/constants.dart';
import 'package:copartner/common/extension.dart';
import 'package:copartner/common/theme.dart';
import 'package:copartner/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController();
    return ColoredBox(
      color: Colors.black.withOpacity(.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          50.h,
          Row(
            children: [
              Text(
                "Rahul",
                style: context.theme.bodyLarge,
              ),
              10.w,
              Text(
                "Good Day 👋",
                style: context.theme.bodyMedium
                    ?.copyWith(color: Colors.white.withOpacity(0.5)),
              ),
              const Spacer(),
              Row(
                children: [
                  barIcons(
                    SvgPicture.asset(
                      Assets.magnifier,
                      height: iconSize,
                      width: iconSize,
                    ),
                  ),
                  5.w,
                  barIcons(
                    SvgPicture.asset(
                      Assets.bell,
                      height: iconSize,
                      width: iconSize,
                    ),
                  ),
                  5.w,
                  barIcons(const Icon(
                    Icons.person,
                    color: Colors.white,
                  ))
                ],
              ),
            ],
          ),
          20.h,
          SizedBox(
            height: 30,
            child: ListView.separated(
              shrinkWrap: true,
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.serviceType.length,
              separatorBuilder: (context, index) => 10.w,
              itemBuilder: (context, index) => ValueListenableBuilder(
                  valueListenable: controller.selectedType,
                  builder: (context, val, child) {
                    final service = controller.serviceType[index];
                    return CupertinoButton(
                      onPressed: () {
                        controller.selectedType.value = service;
                        log("Service type is ${controller.serviceType[index]}");
                      },
                      padding: EdgeInsets.zero,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: AppColors.border),
                            color: val == service
                                ? AppColors.blue
                                : Colors.transparent),
                        // alignment: Alignment.center,
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          controller.serviceType[index],
                          style: context.theme.bodySmall,
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ).padding(const EdgeInsets.symmetric(horizontal: defaultPadding)),
    );
  }

  Container barIcons(Widget child) {
    return Container(
      height: 34,
      width: 34,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xff1D242D).withOpacity(0.5)
          // gradient: RadialGradient(
          //   colors: [Color(0xff1D242D), Color.fromARGB(255, 70, 79, 92)],
          // ),
          ),
      alignment: Alignment.center,
      child: child,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(homeAppBarHeight);
}
