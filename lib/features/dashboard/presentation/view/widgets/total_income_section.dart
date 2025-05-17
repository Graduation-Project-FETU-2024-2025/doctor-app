import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalIncomeSection extends StatelessWidget {
  const TotalIncomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animation: true,
      radius: 100.0,
      lineWidth: 20.0,
      percent: 0.75,
      backgroundColor: const Color(0xffD9E1F9),
      center: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.of(context).totalIncome,
            style: AppStyles.semiBold20(context),
          ),
          Gap(20.h),
          Text(
            '\$122,330,000',
            style: AppStyles.semiBold18(context),
          ),
        ],
      ),
      progressColor: AppColors.primaryColor,
    );
  }
}
