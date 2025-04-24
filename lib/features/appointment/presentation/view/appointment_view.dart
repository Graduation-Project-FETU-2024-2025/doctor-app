import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/features/appointment/presentation/view/widgets/appointment_requests_list_view.dart';
import 'package:doctor_app/features/appointment/presentation/view/widgets/due_to_appointment_section.dart';
import 'package:doctor_app/features/appointment/presentation/view_model/appointment_cubit/appointment_cubit.dart';
import 'package:doctor_app/features/clinic_timing/presentation/view/widget/custom_date_timeline.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 10.0.h),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: Gap(50.h)),
          SliverToBoxAdapter(
            child: Text(
              S.of(context).today,
              style: AppStyles.semiBold18(context),
            ),
          ),
          SliverToBoxAdapter(child: Gap(30.h)),
          SliverToBoxAdapter(child: CustomDateTimeline()),
          SliverToBoxAdapter(child: Gap(30.h)),
          const DueToAppointmentSection(),
          SliverToBoxAdapter(
            child: Gap(30.h),
          ),
          SliverToBoxAdapter(
            child: Text(
              S.of(context).appointmentRequest,
              style: AppStyles.semiBold18(context),
            ),
          ),
          SliverToBoxAdapter(
            child: Gap(40.h),
          ),
          AppointmentRequestsListView(patientAppointmentList: context.read<AppointmentCubit>().upcomingAppointment,),
        ],
      ),
    );
  }
}
