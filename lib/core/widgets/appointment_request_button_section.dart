import 'package:doctor_app/core/global_cubits/appointment_action_cubit/appointment_action_cubit.dart';
import 'package:doctor_app/core/global_cubits/appointment_action_cubit/appointment_action_state.dart';
import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/widgets/appointment_request_button.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppointmentRequestButtonsSection extends StatelessWidget {
  const AppointmentRequestButtonsSection({
    super.key,
    required this.appointmentId,
  });
  final String appointmentId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentActionCubit, AppointmentActionState>(
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is AcceptAppointmentLoading ||
              state is DeclineAppointmentLoading,
          child: state is AcceptAppointmentSuccess
              ? Text(S.of(context).appointmentAccepted)
              : state is DeclineAppointmentSuccess
                  ? Text(S.of(context).appointmentDeclined)
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppointmentRequestButton(
                          buttonColor: const Color(0xff4169E1),
                          textColor: AppColors.white,
                          onPressed: () => context
                              .read<AppointmentActionCubit>()
                              .acceptAppointment(appointmentId: appointmentId),
                          title: S.of(context).accept,
                        ),
                        Gap(10.w),
                        AppointmentRequestButton(
                          buttonColor: const Color(0xffFDB5B5),
                          textColor: AppColors.red,
                          onPressed: () => context
                              .read<AppointmentActionCubit>()
                              .declineAppointment(appointmentId: appointmentId),
                          title: S.of(context).decline,
                        ),
                      ],
                    ),
        );
      },
    );
  }
}
