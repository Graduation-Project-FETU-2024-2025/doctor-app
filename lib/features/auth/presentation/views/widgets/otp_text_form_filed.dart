import 'package:doctor_app/features/auth/presentation/view_model/otp_cubit/otp_cubit.dart';
import 'package:flutter/material.dart';

class OtpTextFromFiled extends StatelessWidget {
  const OtpTextFromFiled({
    super.key,
    required this.controller,
    required this.focusNode,
    this.autoFocus = false,
    required this.onChanged,
  });
  final TextEditingController controller;

  final FocusNode focusNode;

  final bool autoFocus;
  final void Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.top,
      cursorHeight: 35,
      controller: controller,
      focusNode: focusNode,
      validator: OtpCubit.get(context).numberValidator,
      autofocus: autoFocus,
      onChanged: onChanged,
      textAlign: TextAlign.center,
      maxLength: 1,
      decoration: const InputDecoration(
        counterText: '',
      ),
      keyboardType: TextInputType.number,
    );
  }
}
