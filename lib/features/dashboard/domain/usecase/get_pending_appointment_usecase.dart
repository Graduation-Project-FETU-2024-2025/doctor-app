import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:doctor_app/core/models/appointment_params_model.dart';
import 'package:doctor_app/core/models/patient_appointment_model.dart';
import 'package:doctor_app/core/repositories/appointment_repo.dart';
import 'package:doctor_app/core/usecase/base_usecase.dart';

class GetPendingAppointmentUseCase
    implements
        BaseUseCase<List<PatientAppointmentModel>, AppointmentParamsModel> {
  final AppointmentRepo _appointmentRepo;

  GetPendingAppointmentUseCase(this._appointmentRepo);

  @override
  Future<Either<ApiErrorModel, List<PatientAppointmentModel>>> call(
      AppointmentParamsModel param) async {
    return await _appointmentRepo.getPendingAppointments(
        appointmentParamsModel: param);
  }
}
