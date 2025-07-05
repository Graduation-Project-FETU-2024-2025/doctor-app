part of 'post_appointment_cubit.dart';

@immutable
sealed class PostAppointmentState {}

final class PostAppointmentInitial extends PostAppointmentState {}

final class PostAppointmentLoading extends PostAppointmentState {}

final class PostAppointmentSuccess extends PostAppointmentState {}

final class PostAppointmentFailure extends PostAppointmentState {
  final String message;

  PostAppointmentFailure({required this.message});
}
