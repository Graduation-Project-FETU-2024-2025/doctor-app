import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AppointmentNumbersContainer extends StatelessWidget {
  const AppointmentNumbersContainer({
    super.key,
    required this.iconPath,
    required this.appointmentType,
    required this.appointmentsNumber,
    required this.color,
  });
  final String iconPath;
  final String appointmentType;
  final int appointmentsNumber;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).brightness == Brightness.light
          ? AppColors.white
          : AppColors.darkWhite,
      child: Container(
        constraints: BoxConstraints(
          minWidth: 100.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Column(
          children: [
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  iconPath,
                  height: 15.h,
                ),
              ],
            ),
            Gap(12.h),
            Text(
              appointmentType,
              style: AppStyles.semiBold15(context).copyWith(color: color),
            ),
            Gap(12.h),
            Text(
              appointmentsNumber.toString(),
              style: AppStyles.regular20(context).copyWith(color: color),
            ),
            Gap(30.h),
          ],
        ),
      ),
    );
  }
}
