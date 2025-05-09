import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/features/appointment/presentation/view_model/appointment_cubit/appointment_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentTypeSelectionContainer extends StatelessWidget {
  const AppointmentTypeSelectionContainer(
      {super.key, required this.currentAppointment, required this.title});
  final CurrentAppointment currentAppointment;
  final String title;
  @override
  Widget build(BuildContext context) {
    final isSelected =
        context.read<AppointmentCubit>().appointment == currentAppointment;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor =
        isSelected ? (isDark ? AppColors.darkWhite : AppColors.black) : null;

    final textColor = isSelected
        ? AppColors.white
        : (isDark ? AppColors.white : AppColors.black);
    return InkWell(
      onTap: () {
        context
            .read<AppointmentCubit>()
            .selectAppointmentTypes(currentAppointment);
      },
      child: AnimatedContainer(
        constraints: BoxConstraints(minWidth: 81),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(color: AppColors.gray),
          color: backgroundColor,
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: AppStyles.semiBold14(context).copyWith(color: textColor),
        ),
      ),
    );
  }
}
