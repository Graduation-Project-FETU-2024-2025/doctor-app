import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'appointment_edit_state.dart';

class AppointmentEditCubit extends Cubit<AppointmentEditState> {
  AppointmentEditCubit() : super(AppointmentEditInitial());

  final startTimeController= TextEditingController();
  final endTimeController= TextEditingController();





  @override
  Future<void> close() {
    startTimeController.dispose();
    endTimeController.dispose();
    return super.close();
  }

}
