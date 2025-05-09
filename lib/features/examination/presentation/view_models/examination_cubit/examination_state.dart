part of 'examination_cubit.dart';

@immutable
sealed class ExaminationState {}

final class ExaminationInitial extends ExaminationState {}

final class ExaminationUpdated extends ExaminationState {}
