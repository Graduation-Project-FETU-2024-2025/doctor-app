import 'package:doctor_app/core/helpers/extentions.dart';
import 'package:doctor_app/core/routers/routing.dart';
import 'package:doctor_app/core/widgets/custom_button.dart';
import 'package:doctor_app/core/widgets/toast.dart';
import 'package:doctor_app/features/auth/presentation/view_model/otp_cubit/otp_cubit.dart';
import 'package:doctor_app/features/auth/presentation/view_model/otp_cubit/otp_state.dart';
import 'package:doctor_app/features/auth/presentation/views/widgets/loading_widget.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpSignInBlocConsumerButton extends StatelessWidget {
  const OtpSignInBlocConsumerButton({
    super.key,
    required this.email,
  });
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpCubit, OtpState>(
      listenWhen: (previous, current) =>
          current is OtpCheckSuccess || current is OtpCheckFailure,
      listener: (context, state) {
        if (state is OtpCheckSuccess) {
          context.pushNamedAndRemoveUntil(Routing.home,
              predicate: (route) => false);
        } else if (state is OtpCheckFailure) {
          errorToast(message: state.apiErrorModel.message!);
        }
      },
      buildWhen: (previous, current) =>
          current is OtpCheckSuccess ||
          current is OtpCheckFailure ||
          current is OtpCheckLoading,
      builder: (context, state) {
        return state is OtpCheckLoading
            ? const LoadingWidget()
            : CustomButton(
                onPressed: () {
                  OtpCubit.get(context).submitOtp(email);
                },
                text: S.of(context).continueOtp,
              );
      },
    );
  }
}
