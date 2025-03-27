import 'package:doctor_app/core/database/cache/cache_keys.dart';
import 'package:doctor_app/core/database/cache/cashe_helper.dart';
import 'package:doctor_app/core/global_cubits/change_language_cubit/change_language_cubit.dart';
import 'package:doctor_app/core/helpers/extentions.dart';
import 'package:doctor_app/core/routers/routing.dart';
import 'package:doctor_app/core/services/get_it.dart';
import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/core/widgets/custom_button.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:doctor_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  void cacheOnboarding(BuildContext context) async {
    await getIt<CacheHelper>()
        .saveData(key: CacheKeys.isFirstTime, value: false);
    if (context.mounted) {
      context.pushReplacementNamed(Routing.signIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(),
            Spacer(),
            AspectRatio(
              aspectRatio: 333 / 249,
              child: Image.asset(AppImages.imagesOnboarding),
            ),
            Text(
              S.of(context).onboarding,
              textAlign: TextAlign.center,
              style: AppStyles.semiBold40(context).copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            Spacer(),
            CustomButton(
              onPressed: () {
                ChangeLanguageCubit.get(context).changeLanguage(language: 'ar');
                cacheOnboarding(context);
              },
              text: 'أكمل باللغة العربية',
              backgroundColor: AppColors.secondaryColor,
            ),
            SizedBox(
              height: 36.h,
            ),
            CustomButton(
              onPressed: () {
                ChangeLanguageCubit.get(context).changeLanguage(language: 'en');
                cacheOnboarding(context);
              },
              text: 'Continue in English',
            ),
            SizedBox(
              height: 50.h,
            )
          ],
        ),
      ),
    );
  }
}
