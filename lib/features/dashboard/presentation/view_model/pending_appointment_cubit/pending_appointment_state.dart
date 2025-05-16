import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:doctor_app/core/models/patient_appointment_model.dart';

sealed class PendingAppointmentState {}

final class AppointmentInitial extends PendingAppointmentState {}

final class AppointmentLoading extends PendingAppointmentState {}

final class AppointmentSuccess extends PendingAppointmentState {
  final List<PatientAppointmentModel> patientAppointment;

  AppointmentSuccess({required this.patientAppointment});
}

final class AppointmentFailure extends PendingAppointmentState {
  final ApiErrorModel message;

  AppointmentFailure({required this.message});
}

final class ChangeAppointmentOption extends PendingAppointmentState {}
