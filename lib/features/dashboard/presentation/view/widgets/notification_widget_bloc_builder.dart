
import 'package:doctor_app/core/helpers/extentions.dart';
import 'package:doctor_app/core/routers/routing.dart';
import 'package:doctor_app/core/utils/app_images.dart';
import 'package:doctor_app/features/dashboard/presentation/view_model/pending_appointment_cubit/pending_appointment_cubit.dart';
import 'package:doctor_app/features/dashboard/presentation/view_model/pending_appointment_cubit/pending_appointment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class NotificationWidgetBlocBuilder extends StatelessWidget {
  const NotificationWidgetBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PendingAppointmentCubit, PendingAppointmentState>(
        builder: (context, state) {
      return Align(
        alignment: AlignmentDirectional.topEnd,
        child: CircleAvatar(
          backgroundColor: const Color(0xffD9E1F9),
          child: IconButton(
            onPressed: state is AppointmentSuccess
                ? () {
                    context
                        .pushNamed(Routing.notification,
                            argument: state.patientAppointment)
                        .then(
                      (value) {
                        if (value) {
                          if (context.mounted) {
                            if (value) {
                              context
                                  .read<PendingAppointmentCubit>()
                                  .getAppointmentsStateEmitter();
                            } else {
                              return;
                            }
                          }
                        }
                      },
                    );
                  }
                : null,
            icon: Badge.count(
              count: state is AppointmentSuccess
                  ? state.patientAppointment.length
                  : 0,
              child: Image.asset(
                AppImages.imagesNotification,
                height: 20.h,
              ),
            ),
          ),
        ),
      );
    });
  }
}
