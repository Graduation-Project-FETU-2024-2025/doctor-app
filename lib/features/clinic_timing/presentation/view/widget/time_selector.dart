import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../view_model/post_appointment/post_appointment_cubit.dart';

class TimeSelector extends StatefulWidget {
  final bool isStartTime;

  const TimeSelector({super.key, required this.isStartTime});

  @override
  State<TimeSelector> createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  final List<String> timeSlots = [
    '08:00 AM',
    '09:00 AM',
    '10:00 PM',
    '11:00 PM',
  ];

  String? selectedTime;

  void selectTime(String time) {
    setState(() {
      selectedTime = time;
      final parsed = TimeOfDay.fromDateTime(
      DateFormat.jm().parse(time), 
    );

    if (widget.isStartTime) {
      context.read<PostAppointmentCubit>().setStartTime(context , parsed);
    } else {
      context.read<PostAppointmentCubit>().setEndTime(context,parsed);
    }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20.w,
      runSpacing: 20.h,
      children: timeSlots.map((time) {
        final isSelected = selectedTime == time;

        return GestureDetector(
          onTap: () => selectTime(time),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: 150.w,
            height: 40.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primaryColor
                  : Theme.of(context).brightness == Brightness.light
                      ? AppColors.primaryColor.withValues(alpha: 0.1)
                      : AppColors.primaryColor.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(isSelected ? 16.r : 12.r),
            ),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: AppStyles.medium15(context).copyWith(
                color: isSelected
                    ? Colors.white
                    : Theme.of(context).brightness == Brightness.light
                        ? AppColors.black.withValues(alpha: 0.4)
                        : AppColors.white.withValues(alpha: 0.4),
              ),
              child: Text(time),
            ),
          ),
        );
      }).toList(),
    );
  }
}
