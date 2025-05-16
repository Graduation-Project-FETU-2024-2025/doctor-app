import 'package:doctor_app/core/routers/routing.dart';
import 'package:doctor_app/core/models/patient_appointment_model.dart';
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
    return patientList.isEmpty
        ? SliverToBoxAdapter(
            child: Text('NO APPOINTMENTS TO DAY'),
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
