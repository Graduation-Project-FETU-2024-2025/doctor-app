import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_icons.dart';
import 'package:doctor_app/core/utils/app_images.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/features/appointment/data/models/patient_appointment_model.dart';
import 'package:doctor_app/features/appointment/presentation/view/widgets/appointment_request_button_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentRequestCard extends StatelessWidget {
  const AppointmentRequestCard({
    super.key,
    required this.patientAppointmentModel,
  });
  final PatientAppointmentModel patientAppointmentModel;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(20.r),
      color: Theme.of(context).brightness == Brightness.light
          ? AppColors.white
          : AppColors.darkWhite,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  20.r,
                ),
                topRight: Radius.circular(
                  20.r,
                ),
              ),
              color: AppColors.primaryColor,
            ),
            child: Row(
              children: [
                SvgPicture.asset(AppIcons.iconAppointmentClock),
                Gap(10.w),
                Text(
                  '${patientAppointmentModel.date},  ${patientAppointmentModel.startTime} - ${patientAppointmentModel.endTime}',
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0.w),
            child: Column(
              children: [
                Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Image.asset(
                      AppImages.imagesAppointmentRequest,
                      height: 50.h,
                    )),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      backgroundImage: CachedNetworkImageProvider(
                        patientAppointmentModel.patientImageUrl,
                      ),
                    ),
                    Gap(10.w),
                    Text(
                      patientAppointmentModel.patientName,
                      style: AppStyles.semiBold15(context),
                    ),
                  ],
                ),
                Gap(30.h),
                AppointmentRequestButtonsSection(),
                Gap(10.h)
              ],
            ),
          )
        ],
      ),
    );
  }
}

