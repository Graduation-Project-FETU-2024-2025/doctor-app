import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class NextAppoinmentSection extends StatelessWidget {
  const NextAppoinmentSection({
    super.key,
    required this.nextAppoinment,
  });
  final String nextAppoinment;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).nextAppointment,
          style: AppStyles.semiBold20(context).copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        Gap(5.h),
        Text(
          nextAppoinment,
          style: AppStyles.semiBold12(context).copyWith(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.black.withOpacity(0.4)
                : AppColors.white.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}
