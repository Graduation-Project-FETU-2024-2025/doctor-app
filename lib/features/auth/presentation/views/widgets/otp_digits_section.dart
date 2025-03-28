import 'package:doctor_app/features/auth/presentation/view_model/otp_cubit/otp_cubit.dart';
import 'package:doctor_app/features/auth/presentation/views/widgets/otp_text_form_filed.dart';
import 'package:flutter/material.dart';
class OTPDigitsSection extends StatelessWidget {
  const OTPDigitsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Form(
        key: OtpCubit.get(context).otpFormKey,
        child: SizedBox(
          height: 65,
          child: Row(
            children: List.generate(
              OtpCubit.get(context).numberOfOtp,
              (index) => Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    end: index == OtpCubit.get(context).numberOfOtp - 1 ? 0 : 5,
                  ),
                  child: OtpTextFromFiled(
                    controller: OtpCubit.get(context).otpControllers[index],
                    focusNode: OtpCubit.get(context).otpFocusNodes[index],
                    autoFocus: index == 0,
                    onChanged: (value) {
                      int otpIndex = OtpCubit.get(context).numberOfOtp - 1;
                      if (index < otpIndex) {
                        OtpCubit.get(context).nextFiled(
                          value,
                          OtpCubit.get(context).otpFocusNodes[index + 1],
                        );
                      }
                      if (index == otpIndex) {
                        OtpCubit.get(context).otpFocusNodes[index].unfocus();
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
