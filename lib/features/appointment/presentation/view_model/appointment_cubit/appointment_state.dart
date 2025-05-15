import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:doctor_app/core/models/patient_appointment_model.dart';

sealed class AppointmentState {}

final class AppointmentInitial extends AppointmentState {}

final class AppointmentLoading extends AppointmentState {}

final class AppointmentSuccess extends AppointmentState {
  final List<PatientAppointmentModel> patientAppointment;

  AppointmentSuccess({required this.patientAppointment});
}

final class AppointmentFailure extends AppointmentState {
  final ApiErrorModel message;

  AppointmentFailure({required this.message});
}

final class ChangeAppointmentOption extends AppointmentState {}
