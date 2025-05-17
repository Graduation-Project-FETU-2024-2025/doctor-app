import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/widgets/add_delete_button.dart';
import 'package:doctor_app/features/clinic_edit/presentation/view_model/edit_clinic/edit_clinic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/toast.dart';
import '../../../../../generated/l10n.dart';

class EditSaveConsumer extends StatelessWidget {
  const EditSaveConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditClinicCubit, EditClinicState>(
      listener: (context, state) {
        if (state is EditClinicLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => Center(child: CircularProgressIndicator()),
          );
        } else if (state is EditClinicSuccess) {
          Navigator.pop(context);
          Navigator.pop(context, true);
          successToast(message: S.of(context).successUpdatedClinic);
        } else if (state is EditClinicFailure) {
          Navigator.pop(context);
          errorToast(message: state.message.message!);
        }
      },
      builder: (context, state) {
        return Center(
          child: SizedBox(
            width: 120.w,
            height: 36.h,
            child: AddDeleteButton(
              onpressed: state is EditClinicLoading
                  ? () {}
                  : () {
                      final formKey = context.read<EditClinicCubit>().formKey;
                      if (formKey.currentState!.validate()) {
                        context.read<EditClinicCubit>().editClinic();
                      } else {
                        errorToast(
                            message: S.of(context).pleaseCompleteAllFields);
                      }
                    },
              title: S.of(context).save,
              color: AppColors.primaryColor,
            ),
          ),
        );
      },
    );
  }
}
