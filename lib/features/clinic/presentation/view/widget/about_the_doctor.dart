import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';

class AboutTheDoctor extends StatelessWidget {
  const AboutTheDoctor({super.key, required this.about});
  final String about;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).aboutTheDoctor,
          style: AppStyles.semiBold15(context),
        ),
        Gap(11.h),
        Container(
          width: double.infinity,
          height: 161.h,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.black.withValues(alpha: 0.1)
              )),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  about,
                  style: AppStyles.semiBold14(context).copyWith(color: AppColors.black.withValues(alpha: 0.6)),
                ),
                Gap(20.h),
              ],
            ),
          ),
        )
      ],
    );
  }
}
