part of 'appointment_date_cubit.dart';

@immutable
sealed class AppointmentDateState {}

final class AppointmentDateInitial extends AppointmentDateState {}

final class AppointmentDateLoading extends AppointmentDateState {}

final class AppointmentDateSuccess extends AppointmentDateState {
  final List<AppointmentDateModel> appointmentDates;

  AppointmentDateSuccess({required this.appointmentDates});
}

final class AppointmentDateFailure extends AppointmentDateState {
  final ApiErrorModel message;

  AppointmentDateFailure({required this.message});
}
