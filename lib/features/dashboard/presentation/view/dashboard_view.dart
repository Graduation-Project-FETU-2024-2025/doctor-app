import 'package:doctor_app/core/utils/app_icons.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/features/dashboard/presentation/view/widgets/user_welcome_section.dart';
import 'package:doctor_app/features/dashboard/presentation/view/widgets/workflow_chart_section.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0.w),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(AppIcons.svgsNotificationIcon),
            ],
          ),
          Gap(30.h),
          const UserWelcomeSection(),
          Gap(35.h),
          Text(
            S.of(context).clinic,
            style: AppStyles.semiBold18(context),
          ),
          WorkflowChartSection(),
        ],
      ),
    );
  }
}
