import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:doctor_app/core/models/appointment_params_model.dart';
import 'package:doctor_app/core/models/patient_appointment_model.dart';
import 'package:doctor_app/core/repositories/appointment_repo.dart';

class GetPendingAppointmentUseCase {
  final AppointmentRepo _appointmentRepo;

  GetPendingAppointmentUseCase(this._appointmentRepo);

  Future<Either<ApiErrorModel, List<PatientAppointmentModel>>>
      getPendingAppointments(
          {required AppointmentParamsModel appointmentParamsModel}) async {
    return await _appointmentRepo.getPendingAppointments(
        appointmentParamsModel: appointmentParamsModel);
  }
}
