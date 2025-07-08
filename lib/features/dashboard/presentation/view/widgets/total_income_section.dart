import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/features/dashboard/presentation/view_model/clinic_statistics_cubit/clinic_statistics_cubit.dart';
import 'package:doctor_app/features/dashboard/presentation/view_model/clinic_statistics_cubit/clinic_statistics_state.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
          BlocBuilder<ClinicStatisticsCubit, ClinicStatisticsState>(
            buildWhen: (previous, current) =>
                current is ClinicStatisticsLoaded ||
                current is ClinicStatisticsLoading ||
                current is ClinicStatisticsError,
            builder: (context, state) {
              if (state is ClinicStatisticsError) {
                return Text(
                  '\$0.0',
                  style: AppStyles.semiBold20(context).copyWith(
                    color: AppColors.primaryColor,
                  ),
                );
              } else if (state is ClinicStatisticsLoaded) {
                return Text(
                  '\$${state.clinicStatistics.totalIncome}',
                  style: AppStyles.semiBold20(context).copyWith(
                    color: AppColors.primaryColor,
                  ),
                );
              } else {
                return Skeletonizer(
                  enabled: true,
                  child: Text(
                    '2',
                    style: AppStyles.semiBold14(context),
                  ),
                );
              }
            },
          ),
        ],
      ),
      progressColor: AppColors.primaryColor,
    );
  }
}
