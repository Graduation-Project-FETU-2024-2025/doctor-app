

import 'package:doctor_app/core/database/api/api_error_model.dart';

sealed class OtpState {}

final class OtpInitial extends OtpState {}

final class OtpCheckLoading extends OtpState {}

final class OtpCheckSuccess extends OtpState {}

final class OtpCheckFailure extends OtpState {
 final ApiErrorModel apiErrorModel;

  OtpCheckFailure({required this.apiErrorModel});
}


final class ResendOTPLoading extends OtpState {}

final class ResendOTPSuccess extends OtpState {}

final class ResendOTPFailure extends OtpState {
  final ApiErrorModel apiErrorModel;

  ResendOTPFailure({required this.apiErrorModel});
}




