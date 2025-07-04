import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../core/widgets/custom_edit_text_form_field.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/edit_clinic/edit_clinic_cubit.dart';

class EditClinicInfo extends StatelessWidget {
  const EditClinicInfo(
      {super.key,
      required this.clinicName,
      required this.specializationName,
      required this.price,
      });
  final String clinicName;
  final String specializationName;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).clinicName, style: AppStyles.semiBold14(context)),
          Gap(18.h),
          CustomEditTextFormField(
            controller: context.read<EditClinicCubit>().clinicNameController,
            hintTxt: S.of(context).clinicName,
            initialVal:clinicName,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).enterClinicName;
              }
              return null;
            },
          ),
          Gap(31.h),
          Text(S.of(context).specializationName,
              style: AppStyles.semiBold14(context)),
          Gap(18.h),
          CustomEditTextFormField(
            controller:
                context.read<EditClinicCubit>().specializationNameController,
            hintTxt: S.of(context).specializationName,
            initialVal: specializationName,
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
            controller: context.read<EditClinicCubit>().priceController,
            hintTxt: S.of(context).price,
            keyboardType: TextInputType.number,
            initialVal: price,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).enterPrice;
              }
              return null;
            },
          ),
          Gap(18.h),
          Text(S.of(context).aboutTheDoctor,
              style: AppStyles.semiBold14(context)),
          Gap(18.h),
          CustomEditTextFormField(
            controller: context.read<EditClinicCubit>().aboutDoctorController,
            hintTxt: S.of(context).aboutTheDoctor,
            // initialVal:, // about Doctor
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).enterSummaryAboutDoctor;
              }
              return null;
            },
            maxLines: 6,
          ),
          Gap(31.h),
        ],
      ),
    );
  }
}
