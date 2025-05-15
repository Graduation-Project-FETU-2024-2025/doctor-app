import 'package:doctor_app/features/clinic_timing/presentation/view/widget/custom_time_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/appointment_date_model.dart';
import 'Timing_save_consumer.dart';
import 'custom_date_timeline.dart';

class ClinicTimingBody extends StatelessWidget {
  const ClinicTimingBody({super.key, required this.appointmentDate});
  final List<AppointmentDateModel> appointmentDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).thisWeek,
              style: AppStyles.semiBold15(context).copyWith(fontSize: 18),
            ),
            Gap(30.h),
            CustomDateTimeline(),
            Gap(49.h),
            CustomTimePick(
              startTime: appointmentDate[0].workingPeriods.first.startTime,
              endTime: appointmentDate[0].workingPeriods.first.endTime,
            ),
            Gap(50.h),
            Text(
              S.of(context).nextWeek,
              style: AppStyles.semiBold15(context).copyWith(fontSize: 18),
            ),
            Gap(30.h),
            CustomDateTimeline(),
            Gap(40.h),
            CustomTimePick(
                startTime: appointmentDate[1].workingPeriods.first.startTime,
                endTime: appointmentDate[1].workingPeriods.first.endTime),
            Gap(30.h),
            TimingSaveConsumer(),
          ],
        ),
      ),
    );
  }
}
