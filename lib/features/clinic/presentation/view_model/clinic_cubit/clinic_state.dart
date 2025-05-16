part of 'clinic_cubit.dart';

@immutable
sealed class ClinicState {}

final class ClinicInitial extends ClinicState {}

final class ClinicLoading extends ClinicState {}

final class ClinicSuccess extends ClinicState {
  final ClinicModel clinicData;

  ClinicSuccess({required this.clinicData});
}

class ClinicFailure extends ClinicState {
  final ApiErrorModel message;

  ClinicFailure({required this.message});
}
