import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_icons.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/features/appointment/data/models/patient_appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientDateContainer extends StatelessWidget {
  const PatientDateContainer({
    super.key,
    required this.patientAppointmentModel,
  });
  final PatientAppointmentModel patientAppointmentModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      margin: EdgeInsets.only(bottom: 30.h),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: AppColors.green,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundImage: CachedNetworkImageProvider(
              patientAppointmentModel.patientImageUrl,
            ),
          ),
          Gap(10.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                patientAppointmentModel.patientName,
                style: AppStyles.semiBold15(context)
                    .copyWith(color: AppColors.white),
              ),
              Gap(10.h),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.iconAppointmentClock),
                  Gap(10.w),
                  Text(
                    '${patientAppointmentModel.startTime}- ${patientAppointmentModel.endTime}',
                    style: AppStyles.semiBold10(context).copyWith(
                      color: AppColors.white.withOpacity(.6),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
