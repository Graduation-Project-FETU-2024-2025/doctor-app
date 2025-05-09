import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/features/examination/presentation/view_models/examination_cubit/examination_cubit.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnalysisDropDownMenu extends StatelessWidget {
  const AnalysisDropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ExaminationCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).addanalysis,
          style: AppStyles.semiBold14(context),
        ),
        SizedBox(height: 12.h),
        DropdownButtonFormField<String>(
          value: null,
          items: cubit.availableAnalyses
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) {
              cubit.addAnalysis(value);
            }
          },
          decoration: InputDecoration(
            hintText: S.of(context).addanalysis,
            hintStyle: AppStyles.semiBold14(context).copyWith(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.black.withOpacity(0.3)
                  : AppColors.white.withOpacity(0.3),
            ),
            fillColor: Colors.transparent,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(
                width: 1,
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.black.withOpacity(0.3)
                    : AppColors.white.withOpacity(0.6),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(
                width: 1,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: cubit.selectedAnalyses.map((analysis) {
            return Chip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
                side: BorderSide(
                  width: 1,
                  color: AppColors.primaryColor,
                ),
              ),
              label: Text(analysis),
              deleteIcon: Icon(Icons.close, size: 18),
              onDeleted: () => cubit.removeAnalysis(analysis),
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? AppColors.white
                  : AppColors.black,
              labelStyle: TextStyle(color: AppColors.primaryColor),
            );
          }).toList(),
        ),
      ],
    );
  }
}
