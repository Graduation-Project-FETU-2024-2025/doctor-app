
import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_images.dart';
import 'package:doctor_app/features/dashboard/presentation/view/widgets/apointment_numbers_container.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BookingSuccessBody extends StatelessWidget {
  const BookingSuccessBody({
    super.key,
    this.missedAppointments,
    this.completedAppointments,
    this.pendingAppointments,
  });
  final int? missedAppointments;
  final int? completedAppointments;
  final int? pendingAppointments;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppointmentNumbersContainer(
          iconPath: AppImages.imagesMissedAppointment,
          appointmentType: S.of(context).missed,
          appointmentsNumber: missedAppointments ?? 13,
          color: AppColors.missedAppointment,
        ),
        Gap(20.w),
        AppointmentNumbersContainer(
          iconPath: AppImages.imagesCompletedAppointment,
          appointmentType: S.of(context).completed,
          appointmentsNumber: completedAppointments ?? 13,
          color: AppColors.completedAppointment,
        ),
        Gap(20.w),
        AppointmentNumbersContainer(
          iconPath: AppImages.imagesPendingAppointment,
          appointmentType: S.of(context).pending,
          appointmentsNumber: pendingAppointments ?? 13,
          color: AppColors.pendingAppointment,
        ),
      ],
    );
  }
}