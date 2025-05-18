import 'package:doctor_app/core/database/cache/cache_keys.dart';
import 'package:doctor_app/core/database/cache/cashe_helper.dart';
import 'package:doctor_app/core/services/get_it.dart';
import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_icons.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/core/widgets/add_delete_button.dart';
import 'package:doctor_app/features/examination/presentation/view_models/examination_cubit/examination_cubit.dart';
import 'package:doctor_app/features/examination/presentation/views/widgets/analysis_drop_down_menu.dart';
import 'package:doctor_app/features/examination/presentation/views/widgets/custom_text_field.dart';
import 'package:doctor_app/features/medicines/presentation/views/medicines_view.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ExaminationViewBody extends StatelessWidget {
  const ExaminationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = ExaminationCubit.get(context);
    cubit.initializeModel(
      doctorId: '256aeb49-c71b-4704-81bd-945b9724359e',
      appointmentId: '9397cc11-3968-4b77-9817-a2391351939c',
    );
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: getIt<CacheHelper>()
                              .getString(key: CacheKeys.currentLanguage) ==
                          'en'
                      ? SvgPicture.asset(
                          AppIcons.svgsBack,
                          height: 37,
                          width: 37,
                        )
                      : SvgPicture.asset(
                          AppIcons.svgsBackRight,
                          height: 37,
                          width: 37,
                        ),
                ),
                Text(
                  S.of(context).Examination,
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
              height: 50.h,
            ),
            CustomTextField(
              label: S.of(context).patientName,
              readOnly: true,
              hintText: 'khaled gamal',
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomTextField(
              label: S.of(context).nextAppointment,
              readOnly: false,
              hintText: S.of(context).nextAppointment,
              controller: cubit.nextAppointmentController,
            ),
            SizedBox(
              height: 30.h,
            ),
            const AnalysisDropDownMenu(),
            SizedBox(
              height: 30.h,
            ),
            CustomTextField(
              label: S.of(context).diagnosis,
              readOnly: false,
              hintText: S.of(context).addDiagnosis,
              maxLines: 8,
              controller: cubit.diagnosisController,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 36.h,
                  width: 120.w,
                  child: AddDeleteButton(
                    title: S.of(context).next,
                    color: AppColors.primaryColor,
                    onpressed: () {
                      cubit.updateModelData();
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return const MedicinesView();
                        }),
                      );
                    },
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
