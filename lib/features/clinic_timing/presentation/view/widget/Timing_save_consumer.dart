import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/widgets/add_delete_button.dart';
import 'package:doctor_app/core/widgets/toast.dart';
import 'package:doctor_app/features/clinic_timing/presentation/view_model/post_appointment/post_appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';

class TimingSaveConsumer extends StatelessWidget {
  const TimingSaveConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostAppointmentCubit, PostAppointmentState>(
      listener: (context, state) {
        if (state is PostAppointmentLoading) {
        } else if (state is PostAppointmentSuccess) {
          successToast(message: S.of(context).updateAppointmentSuccessfully);
        } else if (state is PostAppointmentFailure) {
          errorToast(message: state.message);
        }
      },
      builder: (context, state) {
        return Center(
          child: SizedBox(
            width: 120.w,
            height: 36.h,
            child: AddDeleteButton(
              title: S.of(context).save,
              color: AppColors.primaryColor,
              onpressed: state is PostAppointmentLoading
                  ? () {}
                  : () {
                      context.read<PostAppointmentCubit>().postAppointment();
                    },
            ),
          ),
        );
      },
    );
  }
}
