import 'package:doctor_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../data/models/review_model.dart';

class BookingPriceCard extends StatelessWidget {
  const BookingPriceCard({super.key, required this.specialization, required this.price, required this.reviews});
  final String specialization;
  final String price;
  final List<ReviewModel> reviews;

  @override
  Widget build(BuildContext context) {
       double calculateAverageRating(List<ReviewModel> reviews) {
  if (reviews.isEmpty) return 0.0;
  final total = reviews.fold(0.0, (sum, review) => sum + review.rate);
  return total / reviews.length;
}
final avgRating = calculateAverageRating(reviews);
    return Card(
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.darkGray
          : AppColors.white,
      elevation: 2,
      child: SizedBox(
        width: 340.w,
        height: 120.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 90.w,
              height: 90.h,
              child: Image.asset(AppImages.imagesClinicDetail),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  specialization,
                  style: AppStyles.semiBold15(context)
                      .copyWith(color: AppColors.primaryColor, fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      '$avgRating ',
                      style: AppStyles.semiBold12(context),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      width: 11.w,
                      height: 10.h,
                      child: SvgPicture.asset(
                        AppIcons.svgsStar,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      ' (${reviews.length} Reviews)',
                      style: AppStyles.semiBold12(context),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
            Text(
              '\$$price',
              style:
                  AppStyles.semiBold15(context).copyWith(color: AppColors.red),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
