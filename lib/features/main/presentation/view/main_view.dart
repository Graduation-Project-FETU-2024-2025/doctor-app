import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

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
    const Center(child: Text('Splash')),
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
            inActiveItem: Image.asset(AppImages.imagesUnselectedHome),
            activeItem: Image.asset(AppImages.imagesSelectedHome),
          ),
          BottomBarItem(
            inActiveItem: Image.asset(AppImages.imagesUnselectedAppoinment),
            activeItem: Image.asset(AppImages.imagesSelectedAppoinment),
          ),
          BottomBarItem(
            inActiveItem: Image.asset(AppImages.imagesUnselectedCalender),
            activeItem: Image.asset(AppImages.imagesSelectedCalender),
          ),
          BottomBarItem(
            inActiveItem: Image.asset(AppImages.imagesUnselectedClinic),
            activeItem: Image.asset(AppImages.imagesSelectedClinic),
          ),
          BottomBarItem(
            inActiveItem: Image.asset(AppImages.imagesUnselectedProfile),
            activeItem: Image.asset(AppImages.imagesSelectedProfile),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        kIconSize: kIconSize,
        kBottomRadius: kBottomRadius,
        color: AppColors.primaryColor,
      ),
    );
  }
}
