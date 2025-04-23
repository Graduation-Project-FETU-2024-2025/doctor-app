import 'package:doctor_app/core/utils/app_images.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/features/dashboard/presentation/view/widgets/booking_section.dart';
import 'package:doctor_app/features/dashboard/presentation/view/widgets/total_income_section.dart';
import 'package:doctor_app/features/dashboard/presentation/view/widgets/user_welcome_section.dart';
import 'package:doctor_app/features/dashboard/presentation/view/widgets/workflow_chart_section.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 10.h),
      child: ListView(
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: CircleAvatar(
              backgroundColor: Color(0xffD9E1F9),
              child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  AppImages.imagesNotification,
                  height: 20.h,
                ),
              ),
            ),
          ),
          Gap(30.h),
          const UserWelcomeSection(),
          Gap(35.h),
          Text(
            S.of(context).clinic,
            style: AppStyles.semiBold18(context),
          ),
          WorkflowChartSection(),
          Gap(35.h),
          Text(
            S.of(context).booking,
            style: AppStyles.semiBold18(context),
          ),
          BookingSection(),
          Gap(60.h),
          const TotalIncomeSection(),
        ],
      ),
    );
  }
}
