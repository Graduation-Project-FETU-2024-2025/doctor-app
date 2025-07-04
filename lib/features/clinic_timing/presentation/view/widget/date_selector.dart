import 'package:doctor_app/core/utils/app_icons.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppIcons.svgArrowBack),
        const SizedBox(width: 8),
        Text(
          DateFormat('MMMM d, y').format(DateTime.now()),
          style: AppStyles.semiBold18(context),
        ),
        SizedBox(width: 8.h),
        SvgPicture.asset(AppIcons.svgArrowRight),
      ],
    );
  }
}
