import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/database/api/api_consumer.dart';
import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:doctor_app/core/database/api/end_points.dart';

import '../../../../core/database/api/api_error_handler.dart';
import '../models/appointment_date_model.dart';
import 'appointment_date_repo.dart';

class AppointmentDateRepoImpl implements AppointmentDateRepo {
  final ApiConsumer apiConsumer;
  AppointmentDateRepoImpl({required this.apiConsumer});

  @override
  Future<Either<ApiErrorModel, Unit>> postAppointment(
      AppointmentDateModel model) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.addAppointment,
        data: model.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return const Right(unit);
      } else {
        return Left(ApiErrorHandler.handleError('Failed to post appointment'));
      }
    } on Exception catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
