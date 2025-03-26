import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomEditTextFormField extends StatelessWidget {
  const CustomEditTextFormField({super.key, required this.controller, required this.hintTxt, this.initialVal, this.maxLines, this.suffixIcon} );
  final TextEditingController controller;
  final String? initialVal;
  final String hintTxt;
  final int? maxLines;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    if (initialVal != null && controller.text.isEmpty) {
      controller.text = initialVal!;
    }
    return TextFormField(
      style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.primaryColor),
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(horizontal:17 ,vertical: 5),
        hintText: hintTxt,
        hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.black.withOpacity(0.3)),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 1,color: AppColors.black.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 1,color: AppColors.black.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 1,color: AppColors.black.withOpacity(0.3)),
        ),
      ),

    );
  }
}