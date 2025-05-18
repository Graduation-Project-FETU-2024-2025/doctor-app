import 'package:doctor_app/core/models/patient_appointment_model.dart';
import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_icons.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/features/notifications/presentation/view/widgets/appointment_requests_list_view.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key, required this.patientAppointment});
  final List<PatientAppointmentModel> patientAppointment;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        Navigator.of(context).pop(true);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            S.of(context).appointmentRequest,
            style: AppStyles.semiBold20(context)
                .copyWith(color: AppColors.primaryColor),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            icon: SvgPicture.asset(AppIcons.svgsBack),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0.w),
          child: CustomScrollView(
            slivers: [
              AppointmentRequestsListView(
                patientAppointment: patientAppointment,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
