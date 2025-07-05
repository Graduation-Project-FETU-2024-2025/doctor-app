import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/database/api/api_error_model.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/appointment_date_model.dart';
import '../../../data/models/working_period_model.dart';
import '../../../data/repo/appointment_date_repo.dart';

part 'post_appointment_state.dart';

class PostAppointmentCubit extends Cubit<PostAppointmentState> {
  final AppointmentDateRepo appointmentDateRepo;

  PostAppointmentCubit(this.appointmentDateRepo)
      : super(PostAppointmentInitial());

  final dateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();

  DateTime? selectedDate;
  String? startTime;
  String? endTime;
  final int maxAppointments = 10;

  void setDate(DateTime date) {
    selectedDate = date;
    dateController.text = _formatDate(date);
  }

  void setStartTime(BuildContext context, TimeOfDay time) {
    startTime = _formatTime(time);
    startTimeController.text = _formatDisplayTime(context, time);
  }

  void setEndTime(BuildContext context, TimeOfDay time) {
    endTime = _formatTime(time);
    endTimeController.text = _formatDisplayTime(context, time);
  }

  String _formatDate(DateTime date) =>
      "${date.year}-${_two(date.month)}-${_two(date.day)}T00:00:00";

  String _formatTime(TimeOfDay time) =>
      "${_two(time.hour)}:${_two(time.minute)}:00";

  String _formatDisplayTime(BuildContext context, TimeOfDay time) {
    return time.format(context);
  }

  String _two(int n) => n.toString().padLeft(2, '0');

  AppointmentDateModel? get model {
    if (selectedDate == null || startTime == null || endTime == null) {
      return null;
    }

    return AppointmentDateModel(
      date: selectedDate!,
      appointmentMaxNumber: maxAppointments,
      workingPeriods: [
        WorkingPeriodModel(
          startTime: startTime!,
          endTime: endTime!,
        )
      ],
    );
  }

  Future<void> postAppointment() async {
    final data = model;

    if (data == null) {
      emit(PostAppointmentFailure(message: S.current.noAppointments));
      return;
    }

    emit(PostAppointmentLoading());

    final result = await appointmentDateRepo.postAppointment(data);

    result.fold(
      (ApiErrorModel error) =>
          emit(PostAppointmentFailure(message: error.message!)),
      (_) => emit(PostAppointmentSuccess()),
    );
  }

  @override
  Future<void> close() {
    dateController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    return super.close();
  }
}
