import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/core/widgets/toast.dart';
import 'package:doctor_app/features/clinic_timing/presentation/view/widget/clinic_timing_body.dart';
import 'package:doctor_app/features/clinic_timing/presentation/view_model/appointment_date/appointment_date_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';

class ClinicTimingView extends StatelessWidget {
  const ClinicTimingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).clinicTiming,
          style: AppStyles.semiBold20(context)
              .copyWith(color: AppColors.primaryColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<AppointmentDateCubit, AppointmentDateState>(
        builder: (context, state) {
          if(state is AppointmentDateLoading){
            return CircularProgressIndicator();
          }
          else if(state is AppointmentDateSuccess){
            return ClinicTimingBody(appointmentDate: state.appointmentDates);
          }
          else if (state is AppointmentDateFailure){
            errorToast(message: state.message.message!);
            return SizedBox.shrink();
          }
          else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
