import 'package:doctor_app/core/enums/appointment_state_enum.dart';
import 'package:doctor_app/core/models/appointment_params_model.dart';
import 'package:doctor_app/features/dashboard/domain/usecase/get_pending_appointment_usecase.dart';
import 'package:doctor_app/features/dashboard/presentation/view_model/pending_appointment_cubit/pending_appointment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PendingAppointmentCubit extends Cubit<PendingAppointmentState> {
  PendingAppointmentCubit(this._getPendingAppointmentUseCase)
      : super(AppointmentInitial());
  final GetPendingAppointmentUseCase _getPendingAppointmentUseCase;

  void getAppointmentsStateEmitter() async {
    emit(AppointmentLoading());
    final result = await _getPendingAppointmentUseCase.call(
        AppointmentParamsModel(appointmentState: AppointmentStateEnum.pending));
    result.fold(
      (message) => emit(AppointmentFailure(message: message)),
      (patientAppointment) =>
          emit(AppointmentSuccess(patientAppointment: patientAppointment)),
    );
  }
}
