import 'package:doctor_app/features/examination/data/models/prescription_medicine_model.dart';

class ExaminationModel {
  final String id;
  final String patientName;
  final List<String> analyses;
  final List<PrescriptionMedicineModel> medicines;
  final String diagonsis;
  final String nextAppointment;
  final DateTime createdAt;

  ExaminationModel({
    required this.id,
    required this.patientName,
    required this.analyses,
    required this.medicines,
    required this.diagonsis,
    required this.nextAppointment,
    required this.createdAt,
  });
  ExaminationModel copyWith({
    String? id,
    String? patientName,
    List<String>? analyses,
    List<PrescriptionMedicineModel>? medicines,
    String? diagonsis,
    String? nextAppointment,
  }) {
    return ExaminationModel(
      id: id ?? this.id,
      patientName: patientName ?? this.patientName,
      analyses: analyses ?? this.analyses,
      medicines: medicines ?? this.medicines,
      diagonsis: diagonsis ?? this.diagonsis,
      nextAppointment: nextAppointment ?? this.nextAppointment,
      createdAt: createdAt,
    );
  }
}
