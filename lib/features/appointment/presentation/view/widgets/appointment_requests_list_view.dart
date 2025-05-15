import 'package:doctor_app/features/appointment/data/models/patient_appointment_model.dart';
import 'package:doctor_app/features/appointment/presentation/view/widgets/appointment_request_card.dart';
import 'package:doctor_app/features/appointment/presentation/view_model/appointment_cubit/appointment_cubit.dart';
import 'package:doctor_app/features/appointment/presentation/view_model/appointment_cubit/appointment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppointmentRequestsListView extends StatelessWidget {
  const AppointmentRequestsListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      buildWhen: (previous, current) =>
          current is AppointmentSuccess ||
          current is AppointmentLoading ||
          current is AppointmentFailure,
      builder: (context, state) {
        if (state is AppointmentSuccess) {
          return SliverList.builder(
            itemCount: state.patientAppointment.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(top: index != 0 ? 16.h : 0),
              child: AppointmentRequestCard(
                patientAppointmentModel: state.patientAppointment[index],
              ),
            ),
          );
        } else if (state is AppointmentFailure) {
          return SliverToBoxAdapter(
            child: Text(state.message.message ?? ""),
          );
        } else {
          return SliverList.builder(
            itemCount: 4,
            itemBuilder: (context, index) => Skeletonizer(
              enabled: true,
              child: Padding(
                padding: EdgeInsets.only(top: index != 0 ? 16.h : 0),
                child: AppointmentRequestCard(
                  patientAppointmentModel: PatientAppointmentModel(
                    patientImageUrl: 'patientImageUrl',
                    patientName: 'patientName',
                    appointmentId: 'appointmentId',
                    patientComment: 'patientComment',
                    status: 'status',
                    time: DateTime.now(),
                    patientId: 'patientId',
                    price: 55,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
