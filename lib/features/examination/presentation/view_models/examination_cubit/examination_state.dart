part of 'examination_cubit.dart';

@immutable
sealed class ExaminationState {}

final class ExaminationInitial extends ExaminationState {}

final class ExaminationUpdated extends ExaminationState {}

final class ExaminationLoading extends ExaminationState {}

final class ExaminationFailure extends ExaminationState {
  final ApiErrorModel errorModel;

  ExaminationFailure({required this.errorModel});
}

final class ExaminationSucess extends ExaminationState {
  final String successMessage;

  ExaminationSucess({required this.successMessage});
}
