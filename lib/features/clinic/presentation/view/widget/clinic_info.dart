import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/review_model.dart';

class ClinicInfo extends StatelessWidget {
  const ClinicInfo({super.key, required this.clinicAddress, required this.clinicPhone, required this.reviews, required this.startTime, required this.endTime});
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
              "$avgRating (${reviews.length} Reviews)",
              style: AppStyles.semiBold15(context).copyWith(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white60
                      : Colors.black38),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Gap(10.h),
        OpeningStatusRow(startTimeStr: startTime,endTimeStr: endTime,)
      ],
    );
  }
}

class OpeningStatusRow extends StatelessWidget {
  final String startTimeStr;
  final String endTimeStr;

  const OpeningStatusRow({
    super.key,
    required this.startTimeStr,
    required this.endTimeStr,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    final DateTime startTime = DateFormat("HH:mm:ss").parse(startTimeStr);
    final DateTime endTime = DateFormat("HH:mm:ss").parse(endTimeStr);

    DateTime todayStart = DateTime(now.year, now.month, now.day, startTime.hour, startTime.minute);
    DateTime todayEnd = DateTime(now.year, now.month, now.day, endTime.hour, endTime.minute);

    // لو وقت النهاية قبل وقت البداية (يعني دوام ليلي)، نزود يوم على النهاية
    if (todayEnd.isBefore(todayStart)) {
      todayEnd = todayEnd.add(const Duration(days: 1));
    }

    final bool isOpen = now.isAfter(todayStart) && now.isBefore(todayEnd);

    return Row(
      children: [
        Text(
          isOpen ? S.of(context).open : S.of(context).close,
          style: AppStyles.semiBold15(context).copyWith(
            color: isOpen ? AppColors.green : Colors.red,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          isOpen ? " .${S.of(context).close} " : " .${S.of(context).open} ",
          style: AppStyles.semiBold15(context).copyWith(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white60
                : Colors.black38,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          DateFormat.jm().format(todayEnd),
          style: AppStyles.semiBold15(context).copyWith(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white60
                : Colors.black38,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}