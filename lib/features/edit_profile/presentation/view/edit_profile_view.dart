import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_icons.dart';
import 'package:doctor_app/core/widgets/custom_edit_text_form_field.dart';
import 'package:doctor_app/features/edit_profile/presentation/view/widgets/custom_profile_image.dart';
import 'package:doctor_app/features/edit_profile/presentation/view/widgets/edit_profile_button_bloc_consumer.dart';
import 'package:doctor_app/features/edit_profile/presentation/view_model/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:doctor_app/features/profile/data/models/user_model.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        Navigator.of(context).pop(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            icon: SvgPicture.asset(
              AppIcons.svgsBack,
            ),
          ),
          title: Text(
            S.of(context).editProfile,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 20),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              Gap(20.h),
              const Row(),
              CustomProfileImage(
                imagePath: userModel.userImage,
              ),
              Gap(25.h),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  S.of(context).name,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              Gap(18.h),
              CustomEditTextFormField(
                initialVal: userModel.userName,
                controller: context.read<EditProfileCubit>().nameController,
                hintTxt: userModel.userName,
              ),
              Gap(50.h),
              const EditProfileButtonBlocConsumer(),
            ],
          ),
        ),
      ),
    );
  }
}
