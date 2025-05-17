import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentRequestButton extends StatelessWidget {
  const AppointmentRequestButton({
    super.key,
    required this.title,
    required this.buttonColor,
    required this.textColor,
    required this.onPressed,
  });
  final String title;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: WidgetStatePropertyAll(
          Size(98.w, 30.h),
        ),
        backgroundColor: WidgetStatePropertyAll(buttonColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: AppStyles.medium15(context).copyWith(color: textColor),
      ),
    );
  }
}
