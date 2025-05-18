import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentActionWidget extends StatelessWidget {
  const AppointmentActionWidget({
    super.key,
    required this.title,
    required this.iconPath,
  });
  final String title;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        Gap(10.w),
        SvgPicture.asset(
          iconPath,
          height: 25,
        ),
      ],
    );
  }
}
