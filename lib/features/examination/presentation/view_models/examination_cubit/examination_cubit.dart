import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'examination_state.dart';

class ExaminationCubit extends Cubit<ExaminationState> {
  ExaminationCubit() : super(ExaminationInitial());

  final nextAppointmentController = TextEditingController();
  final diagnosisController = TextEditingController();

  final List<String> availableAnalyses = [
    'Blood Test',
    'Urine Test',
    'X-Ray',
    'MRI',
    'CT Scan',
    'ECG',
    'Ultrasound',
    'Liver Function',
    'Kidney Function',
  ];

  final List<String> selectedAnalyses = [];

  void addAnalysis(String analysis) {
    if (!selectedAnalyses.contains(analysis)) {
      selectedAnalyses.add(analysis);
      emit(ExaminationUpdated());
    }
  }

  void removeAnalysis(String analysis) {
    selectedAnalyses.remove(analysis);
    emit(ExaminationUpdated());
  }

  @override
  Future<void> close() {
    nextAppointmentController.dispose();
    diagnosisController.dispose();
    return super.close();
  }
}
