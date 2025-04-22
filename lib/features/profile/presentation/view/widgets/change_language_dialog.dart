import 'package:doctor_app/core/database/cache/cache_keys.dart';
import 'package:doctor_app/core/database/cache/cashe_helper.dart';
import 'package:doctor_app/core/global_cubits/change_language_cubit/change_language_cubit.dart';
import 'package:doctor_app/core/global_cubits/change_language_cubit/change_language_state.dart';
import 'package:doctor_app/core/services/get_it.dart';
import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/features/profile/presentation/view/widgets/custom_radio_button.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ChangeLanguageDialog extends StatelessWidget {
  const ChangeLanguageDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String selectedValue = getIt<CacheHelper>().getString(key: CacheKeys.currentLanguage)??'en';
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
      decoration: BoxDecoration(
        color:Theme.of(context).brightness == Brightness.dark?AppColors.darkGray :AppColors.gray,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    S.of(context).arabic,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  GestureDetector(
                    onTap: () {
                      ChangeLanguageCubit.get(context).changeLanguage(
                        language: ChangeLanguageCubit.get(context).arabic,
                      );
                    },
                    child: CustomRadioButton(
                      isSelected: selectedValue == 'ar',
                    ),
                  ),
                ],
              ),
              Gap(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    S.of(context).english,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  GestureDetector(
                    onTap: () {
                      ChangeLanguageCubit.get(context).changeLanguage(
                          language: ChangeLanguageCubit.get(context).english);
                    },
                    child: CustomRadioButton(
                      isSelected: selectedValue == 'en',
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
