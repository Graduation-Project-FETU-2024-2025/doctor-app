

import 'package:doctor_app/core/global_cubits/appointment_action_cubit/appointment_action_state.dart';
import 'package:doctor_app/core/repositories/appointment_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentActionCubit extends Cubit<AppointmentActionState> {
  AppointmentActionCubit(this._appointmentRepo) : super(AppointmentActionInitial());

    final AppointmentRepo _appointmentRepo;

  void acceptAppointment({required String appointmentId}) async {
    emit(AcceptAppointmentLoading(appointmentId: appointmentId));
    final result =
        await _appointmentRepo.acceptAppointment(appointmentId: appointmentId);

    result.fold(
      (apiErrorModel) => AcceptAppointmentFailure(apiErrorModel: apiErrorModel,appointmentId: appointmentId),
      (message) => emit(AcceptAppointmentSuccess(message: message,appointmentId: appointmentId)),
    );
  }

  void declineAppointment({required String appointmentId}) async {
    emit(DeclineAppointmentLoading(appointmentId: appointmentId));
    final result =
        await _appointmentRepo.declineAppointment(appointmentId: appointmentId);

    result.fold(
      (apiErrorModel) =>
          emit(DeclineAppointmentFailure(apiErrorModel: apiErrorModel,appointmentId: appointmentId)),
      (message) => emit(DeclineAppointmentSuccess(message: message,appointmentId: appointmentId)),
    );
  }
  
}
