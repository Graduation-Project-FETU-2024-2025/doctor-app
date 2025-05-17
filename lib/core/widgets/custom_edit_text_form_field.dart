import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class CustomEditTextFormField extends StatelessWidget {
  const CustomEditTextFormField(
      {super.key,
      required this.controller,
      required this.hintTxt,
      this.initialVal,
      this.maxLines,
      this.suffixIcon,
      this.readOnly,
      this.keyboardType,
      this.validator});
  final TextEditingController controller;
  final String? initialVal;
  final String hintTxt;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    if (initialVal != null && controller.text.isEmpty) {
      controller.text = initialVal!;
    }
    return TextFormField(
      onTapOutside: (v) {
        FocusScope.of(context).unfocus();
      },
      style:
          AppStyles.semiBold14(context).copyWith(color: AppColors.primaryColor),
      controller: controller,
      maxLines: maxLines,
      readOnly: readOnly ?? false,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        fillColor: Colors.transparent,
        contentPadding: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
        hintText: hintTxt,
        hintStyle: AppStyles.semiBold14(context).copyWith(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColors.black.withOpacity(0.3)
              : AppColors.white.withOpacity(0.3),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:
              BorderSide(width: 1, color: AppColors.black.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.black.withOpacity(0.3)
                : AppColors.primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.black.withOpacity(0.3)
                : AppColors.white.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}
