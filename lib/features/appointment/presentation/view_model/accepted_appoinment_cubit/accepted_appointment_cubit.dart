import 'package:doctor_app/core/enums/appointment_state_enum.dart';
import 'package:doctor_app/core/enums/current_appointment_enum.dart';
import 'package:doctor_app/core/models/appointment_params_model.dart';
import 'package:doctor_app/core/models/patient_appointment_model.dart';
import 'package:doctor_app/features/appointment/domain/usecases/get_accepted_appointments_usecase.dart';
import 'package:doctor_app/features/appointment/presentation/view_model/accepted_appoinment_cubit/accepted_appointment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AcceptedAppointmentCubit extends Cubit<AcceptedAppointmentState> {
  AcceptedAppointmentCubit(this._getAcceptedAppointmentsUseCase)
      : super(AcceptedAppointmentInitial());

  final GetAcceptedAppointmentsUseCase _getAcceptedAppointmentsUseCase;
  List<PatientAppointmentModel> upcomingAppointment = [];
  List<PatientAppointmentModel> pastAppointment = [];
  CurrentAppointment appointment = CurrentAppointment.upComing;

  void acceptedAppointmentsStateEmitter() async {
    emit(AcceptedAppointmentLoading());
    final result =
        await _getAcceptedAppointmentsUseCase.getAcceptedAppointments(
            appointmentParamsModel: AppointmentParamsModel(
                appointmentState: AppointmentStateEnum.accepted));

    result.fold(
      (apiErrorModel) =>
          emit(AcceptedAppointmentFailure(apiErrorModel: apiErrorModel)),
      (patientAppointments) {
        emit(AcceptedAppointmentSuccess(
            patientAppointments: patientAppointments));

        upcomingAppointment = patientAppointments
            .where((element) => !element.time.isBefore(DateTime.now()))
            .toList();

        pastAppointment = patientAppointments
            .where((element) => element.time.isBefore(DateTime.now()))
            .toList();
      },
    );
  }

  void selectAppointmentTypes(CurrentAppointment currentAppointment) {
    if (appointment != currentAppointment) {
      appointment = currentAppointment;
      emit(ChangeAppointmentOption());
    }
  }
}
