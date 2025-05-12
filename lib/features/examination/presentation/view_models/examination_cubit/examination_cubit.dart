import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/examination/data/models/examination_model.dart';
import 'package:doctor_app/features/examination/data/models/prescription_medicine_model.dart';
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
  final List<PrescriptionMedicineModel> selectedMedicines = [];
  late ExaminationModel examinationModel;

  void initializeModel({required String patientName}) {
    examinationModel = ExaminationModel(
      id: 'farah',
      patientName: patientName,
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

  void addMedicine(PrescriptionMedicineModel medicine) {
    if (!selectedMedicines.any((m) => m.id == medicine.id)) {
      selectedMedicines.add(medicine);
      emit(ExaminationUpdated());
    }
  }

  void updateMedicine({
    required String medicineId,
    required int dosage,
    String? instructions,
  }) {
    final medicine = selectedMedicines.firstWhere((m) => m.id == medicineId);
    medicine.updateDosage(dosage);
    medicine.updateInstructions(instructions ?? '');
    emit(ExaminationUpdated());
  }

  void removeMedicine(String medicineId) {
    selectedMedicines.removeWhere((m) => m.id == medicineId);
    emit(ExaminationUpdated());
  }

  void updateModelData() {
    examinationModel = examinationModel.copyWith(
      nextAppointment: nextAppointmentController.text,
      diagonsis: diagnosisController.text,
      analyses: selectedAnalyses,
      medicines: selectedMedicines,
    );
    emit(ExaminationUpdated());
  }

  @override
  Future<void> close() {
    nextAppointmentController.dispose();
    diagnosisController.dispose();
    return super.close();
  }
}
