import 'package:doctor_app/core/enums/current_appointment_enum.dart';
import 'package:doctor_app/features/appointment/presentation/view/widgets/appointment_type_selection_container.dart';
import 'package:doctor_app/features/appointment/presentation/view/widgets/patient_date_container_list_view.dart';
import 'package:doctor_app/features/appointment/presentation/view_model/accepted_appoinment_cubit/accepted_appointment_cubit.dart';
import 'package:doctor_app/features/appointment/presentation/view_model/accepted_appoinment_cubit/accepted_appointment_state.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliver_tools/sliver_tools.dart';

class DueToAppointmentSection extends StatelessWidget {
  const DueToAppointmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AcceptedAppointmentCubit>();
    return BlocBuilder<AcceptedAppointmentCubit, AcceptedAppointmentState>(
      buildWhen: (previous, current) => current is ChangeAppointmentOption,
      builder: (context, state) {
        return MultiSliver(
          children: [
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppointmentTypeSelectionContainer(
                    currentAppointment: CurrentAppointment.upComing,
                    title: S.of(context).upcoming,
                  ),
                  Gap(10.h),
                  AppointmentTypeSelectionContainer(
                    currentAppointment: CurrentAppointment.past,
                    title: S.of(context).past,
                  ),
                ],
              ),
            ),
            Gap(30.h),
            PatientDateContainerListView(
              patientList: cubit.appointment == CurrentAppointment.upComing
                  ? cubit.upcomingAppointment
                  : cubit.pastAppointment,
            ),
          ],
        );
      },
    );
  }
}
