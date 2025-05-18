import 'package:doctor_app/core/database/api/api_error_model.dart';

sealed class AppointmentActionState {
  final String appointmentId;

  AppointmentActionState({required this.appointmentId});
}

final class AppointmentActionInitial extends AppointmentActionState {
  AppointmentActionInitial({ super.appointmentId=''});
}

final class AcceptAppointmentLoading extends AppointmentActionState {
  AcceptAppointmentLoading({required super.appointmentId});
  
}

final class AcceptAppointmentSuccess extends AppointmentActionState {
  final String message;

  AcceptAppointmentSuccess({required super.appointmentId, required this.message});

  
}

final class AcceptAppointmentFailure extends AppointmentActionState {
  final ApiErrorModel apiErrorModel;

  AcceptAppointmentFailure({required super.appointmentId, required this.apiErrorModel});
}

final class DeclineAppointmentLoading extends AppointmentActionState {
  DeclineAppointmentLoading({required super.appointmentId});

}

final class DeclineAppointmentSuccess extends AppointmentActionState {
  final String message;

  DeclineAppointmentSuccess({required super.appointmentId, required this.message});
}

final class DeclineAppointmentFailure extends AppointmentActionState {
  final ApiErrorModel apiErrorModel;

  DeclineAppointmentFailure({required super.appointmentId, required this.apiErrorModel});
}
