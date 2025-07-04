import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../clinic/data/models/clinic_model.dart';
import 'Timing_save_consumer.dart';
import 'date_picker_field.dart';
import 'date_selector.dart';
import 'set_user_time.dart';
import 'time_selector.dart';

class ClinicTimingViewBody extends StatelessWidget {
  const ClinicTimingViewBody({super.key, this.clinicData});
  final ClinicModel? clinicData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(31.0),
      child: ListView(
        children: [
          if (clinicData != null)
            AppointmentContainer(
              clinicData: clinicData,
            ),
          Gap(30.h),
          const DateSelector(),
          Gap(30.h),
          const DatePickerField(),
          Gap(63.h),
          const SetUserTime(),
          Gap(32.h),
          const TimeSelector(isStartTime: true),
          Gap(40.h),
          Text(S.of(context).endTime,
              style: AppStyles.semiBold15(context)
                  .copyWith(color: AppColors.black.withValues(alpha: 0.3))),
          Gap(30.h),
          const TimeSelector(isStartTime: false),
          Gap(30.h),
          const TimingSaveConsumer(),
        ],
      ),
    );
  }
}

class AppointmentContainer extends StatelessWidget {
  const AppointmentContainer({super.key, this.clinicData});
  final ClinicModel? clinicData;

  @override
  Widget build(BuildContext context) {
    String startTimeParsed =
        clinicData!.appointmentDates[0].workingPeriods[0].startTime;
    String endTimeParsed = clinicData!.appointmentDates[0].workingPeriods[0].endTime;
    String? startTime = DateFormat.jm().format(DateFormat("HH:mm:ss").parse(startTimeParsed));
    String? endTime = DateFormat.jm().format(DateFormat("HH:mm:ss").parse(endTimeParsed));
    return Container(
      width: 200,
      height: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Text(
            "${S.of(context).workingPeriods} ${S.of(context).thisWeek}",
            style: AppStyles.semiBold15(context)
                .copyWith(color: AppColors.primaryColor),
          ),
          Gap(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                startTime,
                style: AppStyles.semiBold15(context)
                    .copyWith(color: AppColors.primaryColor),
              ),
              Text(
                endTime,
                style: AppStyles.semiBold15(context)
                    .copyWith(color: AppColors.primaryColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
