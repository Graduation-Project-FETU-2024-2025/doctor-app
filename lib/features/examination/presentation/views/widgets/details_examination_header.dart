import 'package:doctor_app/core/database/cache/cache_keys.dart';
import 'package:doctor_app/core/database/cache/cashe_helper.dart';
import 'package:doctor_app/core/helpers/extentions.dart';
import 'package:doctor_app/core/services/get_it.dart';
import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_icons.dart';
import 'package:doctor_app/core/utils/app_images.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class DetailsExaminationHeader extends StatelessWidget {
  const DetailsExaminationHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.35,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(
            150.r,
          ),
        ),
      ),
      child: Column(
        children: [
          Gap(15.h),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Transform.rotate(
                  angle: getIt<CacheHelper>()
                              .getString(key: CacheKeys.currentLanguage) ==
                          'en'
                      ? 0
                      : 3.14,
                  child: SvgPicture.asset(
                    AppIcons.svgsAuthBackIcon,
                  ),
                ),
              ),
              Text(
                S.of(context).prescription,
                style: AppStyles.medium15(context).copyWith(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.white
                      : AppColors.black,
                ),
              ),
            ],
          ),
          Gap(35.h),
          CircleAvatar(
            radius: 40.r,
            backgroundColor: Colors.red,
            backgroundImage: const AssetImage(AppImages.imagesAvatar),
          ),
          Gap(15.h),
          Text(
            'Khaled Gamal',
            style: AppStyles.semiBold30(context).copyWith(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.white
                  : AppColors.black,
            ),
          )
        ],
      ),
    );
  }
}
