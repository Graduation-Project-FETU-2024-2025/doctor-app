import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';

class ClinicDetailInfo extends StatelessWidget {
  const ClinicDetailInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              height: 20.h,
              width: 20.w,
              child: SvgPicture.asset(
                AppIcons.svgsLocationIcon,
                fit: BoxFit.cover,
              ),
            ),
            Gap(5.w),
            Text(
              'Egypt, Tanta, El Estad Street',
              style: AppStyles.semiBold15(context)
                  .copyWith(color: AppColors.black.withOpacity(0.4)),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Gap(10.h),
        Row(
          children: [
            SizedBox(
              height: 20.h,
              width: 20.w,
              child: SvgPicture.asset(
                AppIcons.svgsPhoneIcon,
                fit: BoxFit.cover,
              ),
            ),
            Gap(5.w),
            Text(
              '0108749834685',
              style: AppStyles.semiBold15(context)
                  .copyWith(color: AppColors.black.withOpacity(0.4)),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Gap(10.h),
        Row(
          children: [
            SizedBox(
              width: 20.w,
              height: 20.h,
              child: SvgPicture.asset(
                AppIcons.svgsStarIcon,
                fit: BoxFit.cover,
              ),
            ),
            Gap(5.h),
            Text(
              "4.5 (120 Reviews)",
              style: AppStyles.semiBold15(context)
                  .copyWith(color: AppColors.black.withOpacity(0.4)),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Gap(10.h),
        Row(
          children: [
            Text(
              "Open ",
              style: AppStyles.semiBold15(context)
                  .copyWith(color: AppColors.green),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              ".Closes ",
              style: AppStyles.semiBold15(context)
                  .copyWith(color: AppColors.black.withOpacity(0.4)),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "17:00",
              style: AppStyles.semiBold15(context)
                  .copyWith(color: AppColors.black.withOpacity(0.4)),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )
      ],
    );
  }
}
