import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AddDeleteButton extends StatelessWidget {
  const AddDeleteButton(
      {super.key,
      required this.title,
      required this.color,
      required this.onpressed});
  final String title;
  final Color color;
  final void Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(color),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      onPressed: onpressed,
      child: Text(
        title,
        style: AppStyles.semiBold15(context).copyWith(
          fontSize: 18,
          color: AppColors.white,
        ),
      ),
    );
  }
}
