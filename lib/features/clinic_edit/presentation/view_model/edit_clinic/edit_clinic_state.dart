part of 'edit_clinic_cubit.dart';

@immutable
sealed class EditClinicState {}

final class EditClinicInitial extends EditClinicState {}

final class EditClinicLoading extends EditClinicState {}

final class EditClinicSuccess extends EditClinicState {}

final class EditClinicFailure extends EditClinicState {
  final ApiErrorModel message;

  EditClinicFailure({required this.message});
}
