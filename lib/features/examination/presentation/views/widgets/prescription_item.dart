import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/features/examination/data/models/prescription_medicine_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PrescriptionItem extends StatelessWidget {
  const PrescriptionItem({
    super.key,
    required this.model,
  });
  final PrescriptionMedicineModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${model.name} x ${model.dosage}',
          style: AppStyles.semiBold15(context),
        ),
        Gap(5.h),
        Text(
          'Dosage: ${model.dosage} times daily',
          style: AppStyles.semiBold12(context).copyWith(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.black.withOpacity(0.4)
                : AppColors.white.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}
