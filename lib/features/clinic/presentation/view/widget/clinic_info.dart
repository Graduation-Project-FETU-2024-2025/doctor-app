import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/review_model.dart';
import 'opening_status_row.dart';

class ClinicInfo extends StatelessWidget {
  const ClinicInfo(
      {super.key,
      required this.clinicAddress,
      required this.clinicPhone,
      required this.reviews,
      required this.startTime,
      required this.endTime});
  final String clinicAddress;
  final String clinicPhone;
  final List<ReviewModel> reviews;
  final String startTime;
  final String endTime;

  @override
  Widget build(BuildContext context) {
    double calculateAverageRating(List<ReviewModel> reviews) {
      if (reviews.isEmpty) return 0.0;
      final total = reviews.fold(0.0, (sum, review) => sum + review.rate);
      return total / reviews.length;
    }

    final avgRating = calculateAverageRating(reviews);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              height: 20.h,
              width: 20.w,
              child: SvgPicture.asset(
                AppIcons.svgsLocation,
                fit: BoxFit.cover,
              ),
            ),
            Gap(5.w),
            Text(
              clinicAddress,
              style: AppStyles.semiBold15(context).copyWith(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white60
                      : Colors.black38),
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
                AppIcons.svgsPhone,
                fit: BoxFit.cover,
              ),
            ),
            Gap(5.w),
            Text(
              clinicPhone,
              style: AppStyles.semiBold15(context).copyWith(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white60
                      : Colors.black38),
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
                AppIcons.svgsStar,
                fit: BoxFit.cover,
              ),
            ),
            Gap(5.h),
            Text(
              "$avgRating (${reviews.length} ${S.of(context).reviews})",
              style: AppStyles.semiBold15(context).copyWith(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white60
                      : Colors.black38),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Gap(10.h),
        OpeningStatusRow(
          startTimeStr: startTime,
          endTimeStr: endTime,
        )
      ],
    );
  }
}
