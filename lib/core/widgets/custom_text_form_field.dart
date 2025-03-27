import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_icons.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../helpers/extentions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.controller,
    // this.validator,
    this.obscureText = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isValid = false;

  String? validator({required String value, required String hintText}) {
    if (hintText
        .toLowerCase()
        .contains(S.of(context).emailAddress.toLowerCase())) {
      if (!value.isValidEmail) {
        return 'Please enter a valid email address';
      }
    } else if (hintText
        .toLowerCase()
        .contains(S.of(context).password.toLowerCase())) {
      if (!value.isValidPassword) {
        return 'Password must be at least 8 characters long and include letters and numbers';
      }
    } else if (hintText
        .toLowerCase()
        .contains(S.of(context).name.toLowerCase())) {
      if (!value.isValidName) {
        return 'Please enter a valid name';
      }
    } else if (hintText
        .toLowerCase()
        .contains(S.of(context).phone.toLowerCase())) {
      if (!value.isValidPhone) {
        return 'Please enter a valid phone number';
      }
    } else {
      return 'Invalid value';
    }

    return null;
  }

  void updateValidationStatus(String value) {
    setState(() {
      isValid = validator(value: value, hintText: widget.hintText!) == null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      onChanged: updateValidationStatus,
      validator: (val) {
        return validator(value: val!, hintText: widget.hintText!);
      },
      style: AppStyles.medium18(context).copyWith(
        color: AppColors.primaryColor,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(
            end: 4.0,
            top: 4,
            start: 4,
          ),
          child: widget.prefixIcon,
        ),
        suffixIcon: isValid
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: widget.suffixIcon ??
                    SvgPicture.asset(
                      AppIcons.svgsEmailCheckedIcon,
                      height: 26.h,
                    ),
              )
            : null,
      ),
    );
  }
}
