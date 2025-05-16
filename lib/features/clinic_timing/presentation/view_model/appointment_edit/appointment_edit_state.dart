part of 'appointment_edit_cubit.dart';

@immutable
sealed class AppointmentEditState {}

final class AppointmentEditInitial extends AppointmentEditState {}
final class AppointmentEditLoading extends AppointmentEditState {}
final class AppointmentEditSuccess extends AppointmentEditState {}
final class AppointmentEditFailure extends AppointmentEditState {}
