
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';
import 'custom_time_pick.dart';

class CustomTimeDialog extends StatelessWidget {
  const CustomTimeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(27.0.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).setAnotherTime,
              style: AppStyles.semiBold20(context),
            ),
            SizedBox(height: 40.h),
            const CustomTimePick(startTime: '2:00',endTime: '3:00',),
            SizedBox(height: 35.h),
            SizedBox(
              width: 90.w,
              height: 30.h,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      const WidgetStatePropertyAll(AppColors.primaryColor),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  S.of(context).save,
                  style: AppStyles.semiBold15(context).copyWith(
                    fontSize: 14,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
