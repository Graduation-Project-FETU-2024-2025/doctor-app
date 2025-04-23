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
  final String appointmentsNumber;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Container(
        constraints: BoxConstraints(
          minWidth: 100.w,
        ),
        // padding: EdgeInsets.symmetric(
        //   horizontal: 25.w,
        // ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          // border: Border.all(color: AppColors.black, width: 1),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(iconPath),
              ],
            ),
            Gap(12.h),
            Text(
              appointmentType,
              style: AppStyles.semiBold15(context).copyWith(color: color),
            ),
            Gap(12.h),
            Text(
              appointmentsNumber,
              style: AppStyles.regular20(context).copyWith(color: color),
            ),
            Gap(30.h),
          ],
        ),
      ),
    );
  }
}
