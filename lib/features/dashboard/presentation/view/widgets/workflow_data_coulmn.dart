import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class WorkflowDataColumn extends StatelessWidget {
  const WorkflowDataColumn({
    super.key,
    required this.title,
    required this.count,
  });
  final String title;
  final String count;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppStyles.semiBold15(context),
        ),
        Text(
          count,
          style: AppStyles.regular20(context).copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
