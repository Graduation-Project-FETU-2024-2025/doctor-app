import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/widgets/add_delete_button.dart';
import 'package:doctor_app/core/widgets/toast.dart';
import 'package:doctor_app/features/edit_profile/presentation/view_model/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:doctor_app/features/edit_profile/presentation/view_model/edit_profile_cubit/edit_profile_state.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileButtonBlocConsumer extends StatelessWidget {
  const EditProfileButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileFailure) {
          errorToast(message: 'Error while updating please try again');
        } else if (state is EditProfileSuccess) {
          Navigator.pop(context, true);
          successToast(message: 'Profile Updated successfully');
        }
      },
      builder: (context, state) {
        return state is EditProfileLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                width: 120.w,
                height: 36.h,
                child: AddDeleteButton(
                  color: AppColors.primaryColor,
                  onpressed: () {
                    context.read<EditProfileCubit>().editProfile();
                  },
                  title: S.of(context).save,
                ),
              );
      },
    );
  }
}
