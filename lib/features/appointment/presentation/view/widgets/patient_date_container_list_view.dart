import 'package:doctor_app/core/routers/routing.dart';
import 'package:doctor_app/core/models/patient_appointment_model.dart';
import 'package:doctor_app/core/widgets/no_appointments.dart';
import 'package:doctor_app/features/appointment/presentation/view/widgets/patient_date_container.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class PatientDateContainerListView extends StatelessWidget {
  const PatientDateContainerListView({
    super.key,
    required this.patientList,
  });
  final List<PatientAppointmentModel> patientList;
  @override
  Widget build(BuildContext context) {
    return patientList.isEmpty
        ? SliverToBoxAdapter(
            child: NoAppointments(title: S.of(context).noAppointments),
          )
        : SliverList.builder(
            itemCount: patientList.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routing.examination);
              },
              child: PatientDateContainer(
                patientAppointmentModel: patientList[index],
              ),
            ),
          );
  }
}
