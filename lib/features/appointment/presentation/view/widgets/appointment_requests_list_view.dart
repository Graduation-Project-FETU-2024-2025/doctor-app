import 'package:doctor_app/features/appointment/data/models/patient_appointment_model.dart';
import 'package:doctor_app/features/appointment/presentation/view/widgets/appointment_request_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentRequestsListView extends StatelessWidget {
  const AppointmentRequestsListView(
      {super.key, required this.patientAppointmentList});
  final List<PatientAppointmentModel> patientAppointmentList;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: patientAppointmentList.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(top: index != 0 ? 16.h : 0),
        child: AppointmentRequestCard(
          patientAppointmentModel: patientAppointmentList[index],
        ),
      ),
    );
  }
}
