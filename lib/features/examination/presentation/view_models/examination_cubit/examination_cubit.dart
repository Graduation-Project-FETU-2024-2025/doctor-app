import 'package:bloc/bloc.dart';
import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:doctor_app/features/examination/data/models/examination_model.dart';
import 'package:doctor_app/features/examination/data/models/prescription_medicine_model.dart';
import 'package:doctor_app/features/examination/data/models/prescription_product_dto.dart';
import 'package:doctor_app/features/examination/data/models/prescription_request_model.dart';
import 'package:doctor_app/features/examination/data/repos/examination_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'examination_state.dart';

class ExaminationCubit extends Cubit<ExaminationState> {
  ExaminationCubit(this.examinationRepo) : super(ExaminationInitial());
  static ExaminationCubit get(context) => BlocProvider.of(context);
  final ExaminationRepo examinationRepo;

  final nextAppointmentController = TextEditingController();
  final diagnosisController = TextEditingController();

  final List<String> availableAnalyses = [
    'CBC',
    'C-RR',
    'X-Ray',
    'MRI',
    'CT Scan',
    'ESR',
    'ECG',
    'Ultrasound',
    'Liver Function',
    'Renal Function',
    'Lipid Profile',
    'TSH',
    'Elctrolytes',
    'Kidney Function',
  ];

  final List<String> selectedAnalyses = [];
  final List<PrescriptionMedicineModel> selectedMedicines = [];
  late ExaminationModel examinationModel;

  void initializeModel(
      {required String doctorId, required String appointmentId}) {
    examinationModel = ExaminationModel(
      doctorId: doctorId,
      appointmentId: appointmentId,
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

  Future<void> sendPrescription() async {
    final result = await examinationRepo.sendPrescription(
        requestModel: PrescriptionRequestModel(
      doctorId: examinationModel.doctorId,
      appointmentId: examinationModel.appointmentId,
      tests: examinationModel.analyses.join(', '),
      diagnosis: examinationModel.diagonsis,
      nextAppointment: examinationModel.nextAppointment,
      prescriptionProductDTOs: examinationModel.medicines
          .map(
            (e) => PrescriptionProductDto(
              systemProductCode: e.id,
              description: e.dosage.toString(),
            ),
          )
          .toList(),
    ));
    result.fold(
      (error) {
        emit(
          ExaminationFailure(errorModel: error),
        );
      },
      (success) {
        emit(
          ExaminationSucess(successMessage: success),
        );
      },
    );
  }

  @override
  Future<void> close() {
    nextAppointmentController.dispose();
    diagnosisController.dispose();
    return super.close();
  }
}
