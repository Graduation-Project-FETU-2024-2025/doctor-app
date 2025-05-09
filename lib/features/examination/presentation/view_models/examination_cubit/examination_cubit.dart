import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/examination/data/models/examination_model.dart';
import 'package:doctor_app/features/medicines/data/models/medicine_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'examination_state.dart';

class ExaminationCubit extends Cubit<ExaminationState> {
  ExaminationCubit() : super(ExaminationInitial());
  static ExaminationCubit get(context) => BlocProvider.of(context);

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
  late ExaminationModel examinationModel;

  void initializeModel({required String patientName}) {
    examinationModel = ExaminationModel(
      id: '',
      name: patientName,
      analyses: [],
      medicines: [],
      diagonsis: '',
      nextAppointment: '',
      createdAt: DateTime.now(),
    );
  }

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

  void updateModelData() {
    examinationModel = examinationModel.copyWith(
      nextAppointment: nextAppointmentController.text,
      diagonsis: diagnosisController.text,
      analyses: selectedAnalyses,
    );
    emit(ExaminationUpdated());
  }

  void toggleMedicine(MedicineModel medicine, bool isSelected) {
    final updatedList = [...examinationModel.medicines];

    if (isSelected) {
      if (!updatedList.contains(medicine)) {
        updatedList.add(medicine);
      }
    } else {
      updatedList.remove(medicine);
    }

    examinationModel = examinationModel.copyWith(medicines: updatedList);
    emit(ExaminationUpdated());
  }

  @override
  Future<void> close() {
    nextAppointmentController.dispose();
    diagnosisController.dispose();
    return super.close();
  }
}
