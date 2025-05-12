
import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:doctor_app/features/profile/data/models/user_model.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final UserModel userModel;

  ProfileSuccess({required this.userModel});
}

final class ProfileFailure extends ProfileState {
  final ApiErrorModel apiErrorModel;

  ProfileFailure({required this.apiErrorModel});
}
