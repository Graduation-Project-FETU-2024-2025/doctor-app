import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_app/core/functions/is_network_image.dart';
import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_icons.dart';
import 'package:doctor_app/core/utils/app_images.dart';
import 'package:doctor_app/features/edit_profile/presentation/view/widgets/build_image_option.dart';
import 'package:doctor_app/features/edit_profile/presentation/view_model/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:doctor_app/features/edit_profile/presentation/view_model/edit_profile_cubit/edit_profile_state.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final editProfileCubit = context.read<EditProfileCubit>(); 

    return Stack(
      children: [
        BlocBuilder<EditProfileCubit, EditProfileState>(
          builder: (context, state) {
            final pickedImage = editProfileCubit.pickedImage;

            return CircleAvatar(
              radius: 45.r,
              backgroundColor: AppColors.gray,
              backgroundImage: pickedImage == null
                  ? isNetworkImage(imagePath)
                      ? CachedNetworkImageProvider(imagePath)
                      : AssetImage(AppImages.personAvatar) as ImageProvider
                  : FileImage(File(pickedImage.path)),
            );
          },
        ),
        Positioned(
          bottom: -10,
          right: -6,
          child: IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                ),
                builder: (bottomSheetContext) => Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.darkGray
                          : AppColors.lightGray,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    height: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BuildImageOption(
                          icon: Icons.photo_library,
                          text: S.of(context).gallery,
                          onTap: () {
                            editProfileCubit.pickImageFromGallery(); 
                            Navigator.pop(bottomSheetContext);
                          },
                        ),
                        BuildImageOption(
                          icon: Icons.camera_alt,
                          text: S.of(context).camera,
                          onTap: () {
                            editProfileCubit.pickImageFromCamera(); 
                            Navigator.pop(bottomSheetContext);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            icon: SvgPicture.asset(AppIcons.svgsCamera),
          ),
        ),
      ],
    );
  }
}
