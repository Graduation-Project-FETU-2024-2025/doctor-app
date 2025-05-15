import 'dart:developer';

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
  Future<Either<ApiErrorModel, List<AppointmentDateModel>>>
      fetchAppointments() async {
    try {
      final response = await apiConsumer.get(EndPoints.getAllAppointment);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        log(data.toString());
        final List<AppointmentDateModel> appointmentDates =
            data.map((e) => AppointmentDateModel.fromJson(e)).toList();
        return Right(appointmentDates);
      } else {
        return Left(ApiErrorHandler.handleError('Error Loading Appointment'));
      }
    } on Exception catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
