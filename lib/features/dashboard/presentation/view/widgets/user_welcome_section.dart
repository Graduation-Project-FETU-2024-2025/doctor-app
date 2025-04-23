import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_images.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserWelcomeSection extends StatelessWidget {
  const UserWelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${S.of(context).goodMorning} khaled',
              style: AppStyles.semiBold30(context),
            ),
            CircleAvatar(
              radius: 73 / 2,
              backgroundImage: AssetImage(
                AppImages.imagesAppIcon,
              ),
            )
          ],
        ),
        Gap(16.h),
        Text(
          S.of(context).letsSee,
          style: AppStyles.regular20(context).copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
