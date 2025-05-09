import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.readOnly,
    this.controller,
    required this.hintText,
    this.keyboardType,
    this.initValue,
    this.maxLines,
  });
  final String label;
  final bool readOnly;
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboardType;
  final String? initValue;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    if (controller != null && controller!.text.isEmpty && initValue != null) {
      controller!.text = initValue!;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.semiBold14(context),
        ),
        SizedBox(
          height: 12.h,
        ),
        Container(
          width: double.infinity,
          height: maxLines != null ? maxLines! * 20 : 50,
          decoration: BoxDecoration(
            color: readOnly
                ? Theme.of(context).brightness == Brightness.light
                    ? Color(0xffE8E8E8)
                    : Color(0xff939393)
                : Colors.transparent,
            borderRadius: readOnly
                ? BorderRadius.circular(10.r)
                : BorderRadius.circular(20.r),
          ),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty && !readOnly) {
                return S.of(context).fieldRequired;
              }
              return null;
            },
            maxLines: maxLines ?? 1,
            keyboardType: keyboardType ?? TextInputType.text,
            onTapOutside: (v) {
              FocusScope.of(context).unfocus();
            },
            controller: controller,
            readOnly: readOnly,
            cursorHeight: 25.h,
            cursorColor: AppColors.primaryColor,
            style: Theme.of(context).textTheme.titleMedium,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              hintText: hintText,
              hintStyle: readOnly
                  ? AppStyles.semiBold14(context)
                  : AppStyles.semiBold14(context).copyWith(
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColors.black.withOpacity(0.3)
                          : AppColors.white.withOpacity(0.3),
                    ),
              fillColor: readOnly
                  ? Theme.of(context).brightness == Brightness.light
                      ? Color(0xffE8E8E8)
                      : Color(0xff939393)
                  : Colors.transparent,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: readOnly
                    ? BorderRadius.circular(10.r)
                    : BorderRadius.circular(20.r),
                borderSide: BorderSide(
                  width: 1,
                  color: readOnly
                      ? Colors.transparent
                      : Theme.of(context).brightness == Brightness.light
                          ? AppColors.black.withOpacity(0.3)
                          : AppColors.white.withOpacity(0.6),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: readOnly
                    ? BorderRadius.circular(10.r)
                    : BorderRadius.circular(20.r),
                borderSide: BorderSide(
                  width: 1,
                  color: readOnly ? Colors.transparent : AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
