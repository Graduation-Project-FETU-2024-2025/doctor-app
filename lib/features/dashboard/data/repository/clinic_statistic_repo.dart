import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:doctor_app/features/dashboard/data/models/clinic_statistics_model.dart';

abstract class ClinicStatisticRepo {
  Future<Either<ApiErrorModel,ClinicStatisticsModel>> getClinicStatistics();
}