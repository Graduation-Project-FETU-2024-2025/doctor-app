import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:doctor_app/features/appointment/data/models/patient_appointment_model.dart';

abstract class AppointmentRepo {
  Future<Either<ApiErrorModel, List<PatientAppointmentModel>>>
      getAppointments();
}
