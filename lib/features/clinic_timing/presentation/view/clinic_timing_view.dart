import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/features/clinic_timing/presentation/view/widget/clinic_timing_body.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';

class ClinicTimingView extends StatelessWidget {
  const ClinicTimingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).clinicTiming,
          style: AppStyles.semiBold20(context)
              .copyWith(color: AppColors.primaryColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: ClinicTimingBody(),
    );
  }
}
