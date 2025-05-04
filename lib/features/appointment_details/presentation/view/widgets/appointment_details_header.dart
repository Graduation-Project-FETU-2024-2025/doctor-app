import 'package:doctor_app/core/helpers/extentions.dart';
import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_icons.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class AppointmentDetailsHeader extends StatelessWidget {
  const AppointmentDetailsHeader(
      {super.key, required this.startTime, required this.endTime, required this.date});
  final String date;
  final String startTime;
  final String endTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.35,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(
            150.r,
          ),
        ),
      ),
      child: Column(
        children: [
          Gap(15.h),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: SvgPicture.asset(
                  AppIcons.svgsAuthBackIcon,
                ),
              ),
              Text(
                S.of(context).appointmentRequest,
                style: AppStyles.medium15(context).copyWith(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.white
                      : AppColors.black,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            '$date\n$startTime - $endTime',
            style: AppStyles.semiBold30(context).copyWith(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.white
                  : AppColors.black,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
