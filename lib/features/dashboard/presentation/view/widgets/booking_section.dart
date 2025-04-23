import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_images.dart';
import 'package:doctor_app/features/dashboard/presentation/view/widgets/apointment_numbers_container.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingSection extends StatelessWidget {
  const BookingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          AppointmentNumbersContainer(
            iconPath: AppImages.imagesMissedAppointment,
            appointmentType: S.of(context).missed,
            appointmentsNumber: '13',
            color: AppColors.missedAppointment,
          ),
          Gap(20.w),
          AppointmentNumbersContainer(
            iconPath: AppImages.imagesCompletedAppointment,
            appointmentType: S.of(context).completed,
            appointmentsNumber: '13',
            color: AppColors.completedAppointment,
          ),
          Gap(20.w),
          AppointmentNumbersContainer(
            iconPath: AppImages.imagesPendingAppointment,
            appointmentType: S.of(context).pending,
            appointmentsNumber: '13',
            color: AppColors.pendingAppointment,
          ),
        ],
      ),
    );
  }
}
