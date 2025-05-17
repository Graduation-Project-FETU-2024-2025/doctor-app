
import 'package:doctor_app/core/database/api/api_error_model.dart';

sealed class AppointmentActionState {}

final class AppointmentActionInitial extends AppointmentActionState {}


final class AcceptAppointmentLoading extends AppointmentActionState {}

final class AcceptAppointmentSuccess extends AppointmentActionState {
  final String message;

  AcceptAppointmentSuccess({required this.message});
}

final class AcceptAppointmentFailure extends AppointmentActionState {
  final ApiErrorModel apiErrorModel;

  AcceptAppointmentFailure({required this.apiErrorModel});
}



final class DeclineAppointmentLoading extends AppointmentActionState {}

final class DeclineAppointmentSuccess extends AppointmentActionState {
  final String message;

  DeclineAppointmentSuccess({required this.message});
}

final class DeclineAppointmentFailure extends AppointmentActionState {
  final ApiErrorModel apiErrorModel;

  DeclineAppointmentFailure({required this.apiErrorModel});
}

