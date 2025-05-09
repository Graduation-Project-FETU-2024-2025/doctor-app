import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/widgets/custom_edit_text_form_field.dart';
import '../../../../../generated/l10n.dart';
import 'clinic_status.dart';

class EditClinicInfo extends StatelessWidget {
  const EditClinicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).clinicName, style: AppStyles.semiBold14(context)),
          Gap(18.h),
          CustomEditTextFormField(
            controller:
                TextEditingController(), //Cubit.get(context).arBranchNameController,
            hintTxt: S.of(context).clinicName,
            initialVal: null, //TODO
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).enterClinicName;
              }
              return null;
            },
          ),
          Gap(18.h),
          Text(S.of(context).clinicStatus,
              style: AppStyles.semiBold14(context)),
          Gap(18.h),
          ClinicStatus(
            controller: TextEditingController(),
          ),
          Gap(31.h),
          Text(S.of(context).specializationName,
              style: AppStyles.semiBold14(context)),
          Gap(18.h),
          CustomEditTextFormField(
            controller:
                TextEditingController(), //Cubit.get(context).arBranchNameController,
            hintTxt: S.of(context).specializationName,
            initialVal: null, //TODO
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).enterSpecializationName;
              }
              return null;
            },
          ),
          Gap(31.h),
          Text(S.of(context).price, style: AppStyles.semiBold14(context)),
          Gap(18.h),
          CustomEditTextFormField(
            controller:
                TextEditingController(), //Cubit.get(context).arBranchNameController,
            hintTxt: S.of(context).price,
            keyboardType: TextInputType.number,
            initialVal: null, //TODO
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).enterPrice;
              }
              return null;
            },
          ),
          Gap(31.h),
        ],
      ),
    );
  }
}
