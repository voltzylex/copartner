import 'package:copartner/common/appcolors.dart';
import 'package:copartner/common/assets.dart';
import 'package:copartner/common/constants.dart';
import 'package:copartner/common/extension.dart';
import 'package:copartner/common/theme.dart';
import 'package:copartner/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// HomeAppBar represents the top app bar of the home page.
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController(); // Instance of HomeController

    return ColoredBox(
      color: Colors.black.withOpacity(.2), // Background color of the app bar
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          50.h, // Vertical spacing
          Row(
            children: [
              Text(
                "Rahul", // Text widget displaying user's name
                style: context.theme.bodyLarge, // Style for large body text
              ),
              10.w, // Horizontal spacing
              Text(
                "Good Day 👋", // Greeting message
                style: context.theme.bodyMedium?.copyWith(
                    color: Colors.white
                        .withOpacity(0.5)), // Style for medium body text
              ),
              const Spacer(), // Flexible spacer
              Row(
                children: [
                  barIcons(
                    SvgPicture.asset(
                      Assets.magnifier, // Icon asset using SVG
                      height: iconSize,
                      width: iconSize,
                    ),
                  ),
                  5.w, // Horizontal spacing
                  barIcons(
                    SvgPicture.asset(
                      Assets.bell, // Icon asset using SVG
                      height: iconSize,
                      width: iconSize,
                    ),
                  ),
                  5.w, // Horizontal spacing
                  barIcons(
                    const Icon(
                      Icons.person, // Icon widget for user profile
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          20.h, // Vertical spacing
          SizedBox(
            height: 30,
            child: ListView.separated(
              shrinkWrap: true,
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.serviceType.length,
              separatorBuilder: (context, index) =>
                  10.w, // Horizontal separator
              itemBuilder: (context, index) => ValueListenableBuilder(
                valueListenable: controller.selectedType,
                builder: (context, val, child) {
                  final service = controller.serviceType[index];
                  return CupertinoButton(
                    onPressed: () {
                      controller.selectedType.value = service;
                    },
                    padding: EdgeInsets.zero,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColors.border),
                        color: val == service
                            ? AppColors.blue
                            : Colors
                                .transparent, // Highlighted color based on selection
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        controller
                            .serviceType[index], // Displaying service type
                        style: context
                            .theme.bodySmall, // Style for small body text
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ).padding(const EdgeInsets.symmetric(
          horizontal: defaultPadding)), // Padding for the entire app bar
    );
  }

  // Widget for circular icons in the app bar
  Container barIcons(Widget child) {
    return Container(
      height: 34,
      width: 34,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xff1D242D)
            .withOpacity(0.5), // Background color for circular icon
        // gradient: RadialGradient(
        //   colors: [Color(0xff1D242D), Color.fromARGB(255, 70, 79, 92)],
        // ),
      ),
      alignment: Alignment.center,
      child: child,
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(homeAppBarHeight); // Preferred size of the app bar
}
