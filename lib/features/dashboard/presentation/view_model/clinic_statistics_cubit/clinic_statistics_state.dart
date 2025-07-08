import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:doctor_app/features/dashboard/data/models/clinic_statistics_model.dart';

sealed class ClinicStatisticsState {}

final class ClinicStatisticsInitial extends ClinicStatisticsState {}

final class ClinicStatisticsLoading extends ClinicStatisticsState {}

final class ClinicStatisticsLoaded extends ClinicStatisticsState {
  final ClinicStatisticsModel clinicStatistics;

  ClinicStatisticsLoaded(this.clinicStatistics);
}

final class ClinicStatisticsError extends ClinicStatisticsState {
  final ApiErrorModel errorModel;

  ClinicStatisticsError(this.errorModel);
}
