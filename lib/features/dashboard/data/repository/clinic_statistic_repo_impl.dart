import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/database/api/api_consumer.dart';
import 'package:doctor_app/core/database/api/api_error_handler.dart';
import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:doctor_app/core/database/api/end_points.dart';
import 'package:doctor_app/features/dashboard/data/models/clinic_statistics_model.dart';
import 'package:doctor_app/features/dashboard/data/repository/clinic_statistic_repo.dart';

class ClinicStatisticRepoImpl implements ClinicStatisticRepo {
  final ApiConsumer _apiConsumer;

  ClinicStatisticRepoImpl(this._apiConsumer);
  @override
  Future<Either<ApiErrorModel, ClinicStatisticsModel>>
      getClinicStatistics() async {
    try {
      final response = await _apiConsumer.get(EndPoints.clinicStatistics);
      return Right(ClinicStatisticsModel.fromJson(response.data['data']));
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
