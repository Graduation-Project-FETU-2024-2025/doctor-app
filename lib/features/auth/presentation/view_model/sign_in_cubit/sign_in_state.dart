import 'package:doctor_app/core/database/api/api_error_model.dart';

sealed class SignInState {}

final class SignInInitial extends SignInState {
  SignInInitial();
}

final class SignInLoading extends SignInState {
  SignInLoading();
}

final class SignInSuccess extends SignInState {
  final String message;
  SignInSuccess({required this.message});
}

final class SignInFailure extends SignInState {
  final ApiErrorModel apiErrorModel;

  SignInFailure({required this.apiErrorModel});
}
