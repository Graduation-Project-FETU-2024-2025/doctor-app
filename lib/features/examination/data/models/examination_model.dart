import 'package:doctor_app/features/examination/data/models/prescription_medicine_model.dart';

class ExaminationModel {
  final String doctorId;
  final String appointmentId;
  final List<String> analyses;
  final List<PrescriptionMedicineModel> medicines;
  final String diagonsis;
  final String nextAppointment;
  final DateTime createdAt;

  ExaminationModel({
    required this.doctorId,
    required this.appointmentId,
    required this.analyses,
    required this.medicines,
    required this.diagonsis,
    required this.nextAppointment,
    required this.createdAt,
  });
  ExaminationModel copyWith({
    String? doctorId,
    String? appointmentId,
    List<String>? analyses,
    List<PrescriptionMedicineModel>? medicines,
    String? diagonsis,
    String? nextAppointment,
  }) {
    return ExaminationModel(
      doctorId: doctorId ?? this.doctorId,
      appointmentId: appointmentId ?? this.appointmentId,
      analyses: analyses ?? this.analyses,
      medicines: medicines ?? this.medicines,
      diagonsis: diagonsis ?? this.diagonsis,
      nextAppointment: nextAppointment ?? this.nextAppointment,
      createdAt: createdAt,
    );
  }
}
