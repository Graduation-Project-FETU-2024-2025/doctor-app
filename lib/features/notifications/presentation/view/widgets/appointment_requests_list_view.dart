import 'package:doctor_app/core/models/patient_appointment_model.dart';
import 'package:doctor_app/features/notifications/presentation/view/widgets/appointment_request_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentRequestsListView extends StatelessWidget {
  const AppointmentRequestsListView({
    super.key,
    required this.patientAppointment,
  });
  final List<PatientAppointmentModel> patientAppointment;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: patientAppointment.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(
            top: 16.h,
            bottom: index + 1 == patientAppointment.length ? 16.h : 0),
        child: AppointmentRequestCard(
          patientAppointmentModel: patientAppointment[index],
        ),
      ),
    );
  }
}
