import 'package:doctor_app/features/appointment/data/models/patient_appointment_model.dart';
import 'package:doctor_app/features/appointment/presentation/view/widgets/patient_date_container.dart';
import 'package:flutter/material.dart';

class PatientDateContainerListView extends StatelessWidget {
  const PatientDateContainerListView({
    super.key,
    required this.patientList,
  });
  final List<PatientAppointmentModel> patientList;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: patientList.length,
      itemBuilder: (context, index) => PatientDateContainer(
        patientAppointmentModel: patientList[index],
      ),
    );
  }
}