import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/features/auth/presentation/views/widgets/otp_digits_section.dart';
import 'package:doctor_app/features/auth/presentation/views/widgets/otp_sing_in_bloc_consumer_button.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:doctor_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class OTPBody extends StatelessWidget {
  const OTPBody({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(20.h),
        Image.asset(
          AppImages.imagesOtp,
        ),
        Gap(20.h),
        Text(
          S.of(context).enterOtp,
          style: AppStyles.medium30(context).copyWith(
                color: AppColors.primaryColor,
              ),
        ),
        Gap(10.h),
        Text(
          S.of(context).enterOtpWeSent,
          style: AppStyles.medium16(context),
        ),
        Gap(10.h),
        Text(
          email,
          style: AppStyles.medium16(context).copyWith(
                color: AppColors.primaryColor,
              ),
        ),
        Gap(30.h),
        OTPDigitsSection(),
        Gap(30.h),
        OtpSignInBlocConsumerButton(email: email),
        Gap(18.h),
        Text(
          S.of(context).haventReceivedOtp,
          style: AppStyles.medium16(context),
        ),
        Gap(10.h),
        TextButton(
          onPressed: () {},
          child: Text(
            S.of(context).resend,
            style: AppStyles.medium16(context).copyWith(
                  color: AppColors.primaryColor,
                ),
          ),
        ),
        Gap(30.h),
      ],
    );
  }
}

