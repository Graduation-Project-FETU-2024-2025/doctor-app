import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_images.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DiagonsisWidget extends StatelessWidget {
  const DiagonsisWidget({
    super.key,
    required this.diagonsis,
  });
  final String diagonsis;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.6),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 20.h,
        ),
        child: Column(children: [
          Row(
            children: [
              Image.asset(
                AppImages.imagesMissedAppointment,
                height: 35.h,
              ),
              Gap(10.w),
              Text(
                S.of(context).diagnosis,
                style: AppStyles.semiBold18(context),
              ),
            ],
          ),
          Gap(15.h),
          Row(
            children: [
              SizedBox(
                width: 30.w,
              ),
              Expanded(
                child: Text(
                  diagonsis,
                  textAlign: TextAlign.center,
                  style: AppStyles.semiBold12(context).copyWith(
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColors.black.withOpacity(0.5)
                        : AppColors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
