import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../clinic/data/models/clinic_model.dart';
import '../../../clinic/presentation/view_model/clinic_cubit/clinic_cubit.dart';
import 'widget/clinic_timing_view_body.dart';

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
      body: BlocBuilder<ClinicCubit, ClinicState>(
          builder: (context, state) {
            if (state is ClinicLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ClinicFailure) {
              return Center(child: Text(state.message.message!));
            } else if (state is ClinicSuccess) {
              ClinicModel clinicData = state.clinicData;
              return ClinicTimingViewBody(clinicData: clinicData);
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
    );
  }
}