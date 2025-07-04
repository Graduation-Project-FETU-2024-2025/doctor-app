import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../clinic/data/models/clinic_model.dart';
import 'Timing_save_consumer.dart';
import 'appointment_container.dart';
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
          Gap(67.h),
          if (clinicData != null)
            AppointmentContainer(
              clinicData: clinicData,
            ),
            Gap(30.h),
        ],
      ),
    );
  }
}
