import 'package:doctor_app/features/profile/presentation/view/widgets/profile_option_container.dart';
import 'package:doctor_app/features/profile/presentation/view/widgets/user_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(),
              const UserInfoWidget(),
              Gap(30.h),
              const ProfileOptionContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
