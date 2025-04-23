import 'package:doctor_app/core/utils/app_images.dart';
import 'package:doctor_app/features/profile/presentation/view/widgets/profile_option_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'widgets/user_info_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(),
            UserInfoWidget(
              imagePath: AppImages.imagesAppIcon,
              name: 'Khaled Elalfy',
            ),
            Gap(30.h),
            ProfileOptionContainer(),
          ],
        ),
      ),
    );
  }
}
