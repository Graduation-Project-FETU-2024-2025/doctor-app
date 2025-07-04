import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../clinic/data/models/clinic_model.dart';

class AppointmentContainer extends StatelessWidget {
  const AppointmentContainer({super.key, this.clinicData});
  final ClinicModel? clinicData;

  @override
  Widget build(BuildContext context) {
    String formatDate(String dateStr) {
      DateTime date = DateTime.parse(dateStr);
      String dayNumber = date.day.toString();
      String dayName =
          DateFormat('EEEE').format(date); // EEEE = اسم اليوم بالكامل
      return '$dayNumber $dayName';
    }

    String formatted =
        formatDate(clinicData!.appointmentDates[0].date.toString());
    String startTimeParsed =
        clinicData!.appointmentDates[0].workingPeriods[0].startTime;
    String endTimeParsed =
        clinicData!.appointmentDates[0].workingPeriods[0].endTime;
    String? startTime =
        DateFormat.jm().format(DateFormat("HH:mm:ss").parse(startTimeParsed));
    String? endTime =
        DateFormat.jm().format(DateFormat("HH:mm:ss").parse(endTimeParsed));
    return Container(
      width: 291.w,
      height: 96.h,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Color(0xff99AFF1),
          borderRadius: BorderRadius.circular(20),
          border:
              Border.all(color: AppColors.primaryColor.withValues(alpha: 0.2)),
          boxShadow: [
            const BoxShadow(
              color: Color(0x40000000),
              offset: Offset(4, 4),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "$startTime ------------------------------------------------",
            style:
                AppStyles.semiBold12(context).copyWith(color: AppColors.white),
          ),
          Text(
            "${S.of(context).workingPeriods}  - $formatted",
            style: AppStyles.medium12(context).copyWith(color: AppColors.black),
          ),
          Text(
            "$endTime ------------------------------------------------",
            style: AppStyles.semiBold12(context)
                .copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
