import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:doctor_app/core/models/patient_appointment_model.dart';

sealed class AcceptedAppointmentState {}

final class AcceptedAppointmentInitial extends AcceptedAppointmentState {}

final class ChangeAppointmentOption extends AcceptedAppointmentState {}

final class AcceptedAppointmentLoading extends AcceptedAppointmentState {}

final class AcceptedAppointmentSuccess extends AcceptedAppointmentState {
  final List<PatientAppointmentModel> patientAppointments;

  AcceptedAppointmentSuccess({required this.patientAppointments});
}

final class AcceptedAppointmentFailure extends AcceptedAppointmentState {
  final ApiErrorModel apiErrorModel;

  AcceptedAppointmentFailure({required this.apiErrorModel});
}
