import 'package:doctor_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/app_styles.dart';

class BookingPriceCard extends StatelessWidget {
  const BookingPriceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 2,
      child: SizedBox(
        width: 334.w,
        height: 116.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 95.w,
              height: 95.h,
              child: Image.asset(AppImages.svgClinicCardImg
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start
              ,
              children: [
                Text(
                'Orthopedist',
                style: AppStyles.semiBold15(context)
                    .copyWith(color: AppColors.primaryColor,fontSize: 18),
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Text(
                    '4.5',
                    style: AppStyles.semiBold12(context)
                        .copyWith(color: AppColors.black.withOpacity(0.4)),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                width: 11.w,
                height: 10.h,
                child: SvgPicture.asset(
                  AppIcons.svgsStarIcon,
                  fit: BoxFit.cover,
                ),
              ),
                  Text(
                    '(120 Reviews)',
                    style: AppStyles.semiBold12(context)
                        .copyWith(color: AppColors.black.withOpacity(0.4)),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              ],
            ),
            Text(
                '\$155.00',
                style: AppStyles.semiBold15(context)
                    .copyWith(color: AppColors.red),
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
      ),
    );
  }
}