import 'package:doctor_app/core/services/get_it.dart';
import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_images.dart';
import 'package:doctor_app/features/appointment/data/repository/appointment_repo.dart';
import 'package:doctor_app/features/appointment/presentation/view/appointment_view.dart';
import 'package:doctor_app/features/appointment/presentation/view_model/appointment_cubit/appointment_cubit.dart';
import 'package:doctor_app/features/clinic/data/repo/clinic_repo.dart';
import 'package:doctor_app/features/clinic/presentation/view_model/clinic_cubit/clinic_cubit.dart';
import 'package:doctor_app/features/clinic_timing/data/repo/appointment_date_repo.dart';
import 'package:doctor_app/features/clinic_timing/presentation/view_model/appointment_date/appointment_date_cubit.dart';
import 'package:doctor_app/features/dashboard/presentation/view/dashboard_view.dart';
import 'package:doctor_app/features/profile/data/repo/profile_repo.dart';
import 'package:doctor_app/features/profile/presentation/model_view/profile_cubit/profile_cubit.dart';
import 'package:doctor_app/features/profile/presentation/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../clinic/presentation/view/clinic_view.dart';
import '../../../clinic_timing/presentation/view/clinic_timing_view.dart';

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
    DashboardView(),
    BlocProvider(
      create: (context) =>
          AppointmentCubit(getIt<AppointmentRepo>())..getAppointmentsStateEmitter(),
      child: AppointmentView(),
    ),
    BlocProvider(
      create: (context) => AppointmentDateCubit(getIt<AppointmentDateRepo>())..fetchAllAppointmentDate(),
      child: ClinicTimingView(),
    ),
    BlocProvider(
      create: (context) => ClinicCubit(clinicRepo: getIt<ClinicRepo>())..fetchClinicDetails(),
      child: ClinicView(),
    ),
    BlocProvider(
      create: (context) =>
          ProfileCubit(getIt<ProfileRepo>())..getProfileEmitter(),
      child: ProfileView(),
    ),
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
