import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/clinic_timing/data/repo/appointment_date_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../core/database/api/api_error_model.dart';
import '../../../data/models/appointment_date_model.dart';

part 'appointment_date_state.dart';

class AppointmentDateCubit extends Cubit<AppointmentDateState> {
  AppointmentDateCubit(this.appointmentDateRepo)
      : super(AppointmentDateInitial());

  final AppointmentDateRepo appointmentDateRepo;

  Future<void> fetchAllAppointmentDate() async {
    emit(AppointmentDateLoading());
    final result = await appointmentDateRepo.fetchAppointments();
    result.fold(
        (message) => emit(AppointmentDateFailure(message: message)),
        (appointmentDates) =>
            emit(AppointmentDateSuccess(appointmentDates: appointmentDates)));
  }
}
