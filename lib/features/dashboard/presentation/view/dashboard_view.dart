import 'package:doctor_app/core/helpers/extentions.dart';
import 'package:doctor_app/core/routers/routing.dart';
import 'package:doctor_app/core/utils/app_images.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/features/dashboard/presentation/view/widgets/booking_section.dart';
import 'package:doctor_app/features/dashboard/presentation/view/widgets/total_income_section.dart';
import 'package:doctor_app/features/dashboard/presentation/view/widgets/user_welcome_section.dart';
import 'package:doctor_app/features/dashboard/presentation/view/widgets/workflow_chart_section.dart';
import 'package:doctor_app/features/dashboard/presentation/view_model/pending_appointment_cubit/pending_appointment_cubit.dart';
import 'package:doctor_app/features/dashboard/presentation/view_model/pending_appointment_cubit/pending_appointment_state.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 10.h),
      child: ListView(
        children: [
          BlocBuilder<PendingAppointmentCubit, PendingAppointmentState>(
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
          }),
          Gap(30.h),
          const UserWelcomeSection(),
          Gap(35.h),
          Text(
            S.of(context).clinic,
            style: AppStyles.semiBold18(context),
          ),
          const WorkflowChartSection(),
          Gap(35.h),
          Text(
            S.of(context).booking,
            style: AppStyles.semiBold18(context),
          ),
          const BookingSection(),
          Gap(60.h),
          const TotalIncomeSection(),
        ],
      ),
    );
  }
}
