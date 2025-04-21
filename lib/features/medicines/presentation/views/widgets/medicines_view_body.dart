import 'package:doctor_app/core/database/cache/cashe_helper.dart';
import 'package:doctor_app/core/services/get_it.dart';
import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_icons.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/core/widgets/add_delete_button.dart';
import 'package:doctor_app/core/widgets/search_text_field.dart';
import 'package:doctor_app/features/medicines/presentation/views/widgets/medicines_grid.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MedicinesViewBody extends StatelessWidget {
  const MedicinesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getIt<CacheHelper>().getCurrentLanguage() == 'en'
                    ? SvgPicture.asset(
                        AppIcons.iconsBack,
                        height: 37,
                        width: 37,
                      )
                    : SvgPicture.asset(
                        AppIcons.iconsBackRight,
                        height: 37,
                        width: 37,
                      ),
                Text(
                  S.of(context).medicines,
                  style: AppStyles.semiBold20(context).copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(
                  width: 50.w,
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            SearchTextField(),
            SizedBox(
              height: 50.h,
            ),
            Text(
              S.of(context).selectMedicines,
              style: AppStyles.semiBold15(context)
                  .copyWith(color: AppColors.black, fontSize: 18),
            ),
            SizedBox(
              height: 30.h,
            ),
            MedicineGrid(),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 36.h,
                  width: 120.w,
                  child: AddDeleteButton(
                    title: S.of(context).save,
                    color: AppColors.primaryColor,
                    onpressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
