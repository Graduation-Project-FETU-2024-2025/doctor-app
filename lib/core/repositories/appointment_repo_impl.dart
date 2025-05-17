import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_app/core/database/api/api_consumer.dart';
import 'package:doctor_app/core/database/api/api_error_handler.dart';
import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:doctor_app/core/database/api/end_points.dart';
import 'package:doctor_app/core/models/appointment_params_model.dart';
import 'package:doctor_app/core/models/patient_appointment_model.dart';
import 'package:doctor_app/core/repositories/appointment_repo.dart';

class AppointmentRepoImpl implements AppointmentRepo {
  final ApiConsumer _apiConsumer;

  AppointmentRepoImpl(this._apiConsumer);
  @override
  Future<Either<ApiErrorModel, List<PatientAppointmentModel>>>
      getPendingAppointments(
          {AppointmentParamsModel? appointmentParamsModel}) async {
    try {
      final Response response = await _apiConsumer.get(
          EndPoints.getPatientAppointments,
          queryParameter: appointmentParamsModel?.toJson());
      List<PatientAppointmentModel> patientAppointment = [];
      for (var appointment in response.data['data']) {
        patientAppointment.add(PatientAppointmentModel.fromJson(appointment));
      }
      return right(patientAppointment);
    } catch (e) {
      return left(ApiErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<ApiErrorModel, String>> acceptAppointment(
      {required String appointmentId}) async {
    try {
      final response =
          await _apiConsumer.put(EndPoints.acceptAppointment(appointmentId));
      return right(response.data['message']);
    } on Exception catch (e) {
      return left(ApiErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<ApiErrorModel, String>> declineAppointment(
      {required String appointmentId}) async {
    try {
      final response =
          await _apiConsumer.put(EndPoints.declineAppointment(appointmentId));
      return right(response.data['message']);
    } on Exception catch (e) {
      return left(ApiErrorHandler.handleError(e));
    }
  }
}
