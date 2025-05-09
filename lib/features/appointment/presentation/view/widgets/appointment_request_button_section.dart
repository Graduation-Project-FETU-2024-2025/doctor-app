import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/features/appointment/presentation/view/widgets/appointment_request_button.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentRequestButtonsSection extends StatelessWidget {
  const AppointmentRequestButtonsSection({
    super.key, required this.onAccept, required this.onDecline,
  });
  final VoidCallback onAccept;
  final VoidCallback onDecline;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppointmentRequestButton(
          buttonColor: Color(0xff4169E1),
          textColor: AppColors.white,
          onPressed:onAccept,
          title: S.of(context).accept,
        ),
        Gap(10.w),
        AppointmentRequestButton(
          buttonColor: Color(0xffFDB5B5),
          textColor: AppColors.red,
          onPressed: onDecline,
          title: S.of(context).decline,
        ),
      ],
    );
  }
}
