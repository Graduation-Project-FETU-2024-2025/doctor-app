import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_images.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class NoAppointments extends StatelessWidget {
  const NoAppointments({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.imgNoAppointments),
        Gap(50.h),
        Text(
          title,
          style: AppStyles.semiBold20(context).copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
