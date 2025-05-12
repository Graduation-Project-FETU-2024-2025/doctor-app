import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_app/core/database/cache/cache_keys.dart';
import 'package:doctor_app/core/database/cache/cashe_helper.dart';
import 'package:doctor_app/core/functions/is_network_image.dart';
import 'package:doctor_app/core/services/get_it.dart';
import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_images.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserWelcomeSection extends StatelessWidget {
  const UserWelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${S.of(context).goodMorning} ${getIt<CacheHelper>().getString(key: CacheKeys.username)}',
              style: AppStyles.semiBold30(context),
            ),
            CircleAvatar(
              radius: 73 / 2,
              backgroundColor: AppColors.gray,
              backgroundImage: isNetworkImage(
                getIt<CacheHelper>().getString(
                  key: CacheKeys.profileImage,
                ),
              )
                  ? CachedNetworkImageProvider(getIt<CacheHelper>().getString(
                      key: CacheKeys.profileImage,
                    )!)
                  : AssetImage(
                      AppImages.personAvatar,
                    ),
            )
          ],
        ),
        Gap(16.h),
        Text(
          S.of(context).letsSee,
          style: AppStyles.regular20(context).copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
