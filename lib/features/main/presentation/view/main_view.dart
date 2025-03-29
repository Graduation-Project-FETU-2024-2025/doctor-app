import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter_svg/svg.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  NotchBottomBarController notchBottomBarController =
      NotchBottomBarController();
  int currentIndex = 0;
  double kIconSize = 24.0;
  double kBottomRadius = 20.0;
  List<Widget> screens = [
    const Center(child: Text('Email')),
    const Center(child: Text('Onboarding')),
    const Center(child: Text('Splash')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: notchBottomBarController,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: SvgPicture.asset(AppIcons.svgsEmailIcon),
            activeItem: SvgPicture.asset(AppIcons.svgsEmailIcon),
            itemLabel: 'Email',
          ),
          BottomBarItem(
            inActiveItem: SvgPicture.asset(AppIcons.svgsAuthBackIcon),
            activeItem: SvgPicture.asset(AppIcons.svgsAuthBackIcon),
            itemLabel: 'Onboarding',
          ),
          BottomBarItem(
            inActiveItem: SvgPicture.asset(AppIcons.svgsEmailCheckedIcon),
            activeItem: SvgPicture.asset(AppIcons.svgsEmailCheckedIcon),
            itemLabel: 'Splash',
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
            print(Theme.of(context).brightness);
          });
        },
        kIconSize: kIconSize,
        kBottomRadius: kBottomRadius,
        color: AppColors.primaryColor,
      ),
    );
  }
}
