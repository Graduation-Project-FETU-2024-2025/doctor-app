import 'package:doctor_app/features/dashboard/presentation/view/widgets/booking_success_body.dart';
import 'package:doctor_app/features/dashboard/presentation/view_model/clinic_statistics_cubit/clinic_statistics_cubit.dart';
import 'package:doctor_app/features/dashboard/presentation/view_model/clinic_statistics_cubit/clinic_statistics_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BookingSection extends StatelessWidget {
  const BookingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BlocBuilder<ClinicStatisticsCubit, ClinicStatisticsState>(
        buildWhen: (previous, current) =>
            current is ClinicStatisticsLoaded ||
            current is ClinicStatisticsLoading ||
            current is ClinicStatisticsError,
        builder: (context, state) {
          if (state is ClinicStatisticsLoaded) {
            return BookingSuccessBody(
              missedAppointments: state.clinicStatistics.canceledAppointments,
              completedAppointments:
                  state.clinicStatistics.confirmedAppointments,
              pendingAppointments: state.clinicStatistics.pendingAppointments,
            );
          }
          return Skeletonizer(
            enabled: state is ClinicStatisticsLoading,
            child: const BookingSuccessBody(),
          );
        },
      ),
    );
  }
}
