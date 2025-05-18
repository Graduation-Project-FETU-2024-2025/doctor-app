import 'dart:async';

import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/widgets/toast.dart';
import 'package:doctor_app/features/auth/presentation/view_model/otp_cubit/otp_cubit.dart';
import 'package:doctor_app/features/auth/presentation/view_model/otp_cubit/otp_state.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ResendOtpBlocListener extends StatefulWidget {
  const ResendOtpBlocListener({
    super.key,
    required this.email,
  });
  final String email;

  @override
  State<ResendOtpBlocListener> createState() => _ResendOtpBlocListenerState();
}

class _ResendOtpBlocListenerState extends State<ResendOtpBlocListener> {
  int counter = 60;
  Timer? _timer;
  void ticTack() {
    _timer?.cancel();
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (counter > 0) {
          setState(() {
            counter--;
          });
        } else {
          timer.cancel();
        }
      },
    );
  }

  @override
  void initState() {
    ticTack();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpCubit, OtpState>(
      listenWhen: (previous, current) =>
          current is ResendOTPLoading ||
          current is ResendOTPSuccess ||
          current is ResendOTPFailure,
      listener: (context, state) {
        if (state is ResendOTPFailure) {
          errorToast(message: state.apiErrorModel.message ?? "error");
        }
        if (state is ResendOTPSuccess) {
          successToast(message: S.of(context).emailResentedSuccessfully);
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: counter == 0
                ? () {
                    context.read<OtpCubit>().resendOTP(widget.email);

                    setState(() {
                      counter = 30;
                      ticTack();
                    });
                  }
                : null,
            child: Text(
              counter != 0
                  ? 'Next code in ${(counter ~/ 60).toString().padLeft(2, '0')}:${(counter % 60).toString().padLeft(2, '0')} '
                  : S.of(context).resend,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
