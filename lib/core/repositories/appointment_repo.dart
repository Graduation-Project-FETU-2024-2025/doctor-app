import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:doctor_app/core/models/appointment_params_model.dart';
import 'package:doctor_app/core/models/patient_appointment_model.dart';

abstract class AppointmentRepo {
  Future<Either<ApiErrorModel, List<PatientAppointmentModel>>>
      getPendingAppointments({AppointmentParamsModel appointmentParamsModel});

  Future<Either<ApiErrorModel, String>> acceptAppointment(
      {required String appointmentId});
  Future<Either<ApiErrorModel, String>> declineAppointment(
      {required String appointmentId});
}
