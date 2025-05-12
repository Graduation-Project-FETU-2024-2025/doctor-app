import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_app/core/functions/is_network_image.dart';
import 'package:doctor_app/core/helpers/extentions.dart';
import 'package:doctor_app/core/routers/routing.dart';
import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_images.dart';
import 'package:doctor_app/features/profile/presentation/model_view/profile_cubit/profile_cubit.dart';
import 'package:doctor_app/features/profile/presentation/model_view/profile_cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccess) {
          return Column(
            children: [
              CircleAvatar(
                radius: 45.r,
                backgroundColor: AppColors.gray,
                backgroundImage: isNetworkImage(state.userModel.userImage)
                    ? CachedNetworkImageProvider(state.userModel.userImage)
                    : AssetImage(AppImages.personAvatar),
              ),
              Gap(25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.userModel.userName,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  IconButton(
                    onPressed: () {
                      context
                          .pushNamed(Routing.editProfile,
                              argument: state.userModel)
                          .then(
                        (value) {
                          if (value == true) {
                            if (context.mounted) {
                              context.read<ProfileCubit>().getProfileEmitter();
                            } else {
                              return;
                            }
                          }
                        },
                      );
                    },
                    icon: Image.asset(
                      Theme.of(context).brightness == Brightness.light
                          ? AppImages.imgEditName
                          : AppImages.imgEditNameDark,
                      height: 24.h,
                    ),
                  ),
                ],
              ),
            ],
          );
        } else if (state is ProfileFailure) {
          return Center(
            child: Text(state.apiErrorModel.message ?? ""),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
