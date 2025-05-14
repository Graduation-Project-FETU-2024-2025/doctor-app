import 'package:doctor_app/features/appointment/data/models/patient_appointment_model.dart';
import 'package:doctor_app/features/appointment/data/repository/appointment_repo.dart';
import 'package:doctor_app/features/appointment/presentation/view_model/appointment_cubit/appointment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum CurrentAppointment { past, upComing }

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit(this._appointmentRepo) : super(AppointmentInitial());
  final AppointmentRepo _appointmentRepo;
  List<PatientAppointmentModel> upcomingAppointment = List.generate(
    3,
    (index) => PatientAppointmentModel(
      time: DateTime.parse("2025-05-30T18:54:00"),
      appointmentId: "b5b900fa-1c3b-4168-f292-08dd4d3390ad",
      patientImageUrl:
          'https://th.bing.com/th/id/R.69b6c7c1419fedc585d4aac2958c5ae4?rik=Ti4lNMU9Co54jg&pid=ImgRaw&r=0',
      patientComment:
          "hfdlnkfksdklfhdkfndlkfdilfhdkfndsfkl\n;ofjdofjisdfhisdhfidhfidsnfksdhfsduif\ndjioshdjkljsfhds",
      patientName: 'upcoming1',
      status: 'Pending',
      patientId: "da5c5263-ea86-4b57-886b-08dd8b41f1e9",
      price: 510,
    ),
  );
  List<PatientAppointmentModel> pastAppointment = List.generate(
    3,
    (index) => PatientAppointmentModel(
      time: DateTime.parse("2025-05-30T18:54:00"),
      appointmentId: "b5b900fa-1c3b-4168-f292-08dd4d3390ad",
      patientImageUrl:
          'https://th.bing.com/th/id/R.69b6c7c1419fedc585d4aac2958c5ae4?rik=Ti4lNMU9Co54jg&pid=ImgRaw&r=0',
      patientComment:
          "hfdlnkfksdklfhdkfndlkfdilfhdkfndsfkl\n;ofjdofjisdfhisdhfidhfidsnfksdhfsduif\ndjioshdjkljsfhds",
      patientName: 'upcoming1',
      status: 'Pending',
      patientId: "da5c5263-ea86-4b57-886b-08dd8b41f1e9",
      price: 510,
    ),
  );

  void getAppointmentsStateEmitter() async {
    emit(AppointmentLoading());
    final result = await _appointmentRepo.getAppointments();
    result.fold(
      (message) => emit(AppointmentFailure(message: message)),
      (patientAppointment) =>
          emit(AppointmentSuccess(patientAppointment: patientAppointment)),
    );
  }

  CurrentAppointment appointment = CurrentAppointment.upComing;
  void selectAppointmentTypes(CurrentAppointment currentAppointment) {
    if (appointment != currentAppointment) {
      appointment = currentAppointment;
      emit(ChangeAppointmentOption());
    }
  }
}
