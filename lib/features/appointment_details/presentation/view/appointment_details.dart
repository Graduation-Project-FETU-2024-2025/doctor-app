import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/core/models/patient_appointment_model.dart';
import 'package:doctor_app/features/notifications/presentation/view/widgets/appointment_request_button_section.dart';
import 'package:doctor_app/features/appointment_details/presentation/view/widgets/appointment_details_header.dart';
import 'package:doctor_app/features/appointment_details/presentation/view/widgets/patient_details_section.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentDetails extends StatelessWidget {
  const AppointmentDetails({super.key, required this.patientAppointmentModel});
  final PatientAppointmentModel patientAppointmentModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppointmentDetailsHeader(
            date: patientAppointmentModel.time,
          ),
          Gap(60.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
              children: [
                PatientDetailsSection(
                  imageUrl: patientAppointmentModel.patientImageUrl,
                  name: patientAppointmentModel.patientName,
                ),
                Gap(40.h),
                Text(
                  '${S.of(context).patientComment}:\n${patientAppointmentModel.patientComment}',
                  style: AppStyles.semiBold18(context).copyWith(
                    height: 3,
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.color!
                        .withOpacity(.5),
                  ),
                ),
                Gap(20.h),
                Container(
                  height: 60,
                  width: 255,
                  color: AppColors.primaryColor,
                ),
                Gap(50.h),
                AppointmentRequestButtonsSection(
                  onAccept: () {},
                  onDecline: () {},
                ),
                Gap(20.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
