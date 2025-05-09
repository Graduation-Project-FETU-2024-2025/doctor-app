import 'package:doctor_app/features/medicines/data/models/medicine_model.dart';

class ExaminationModel {
  final String id;
  final String name;
  final List<String> analyses;
  final List<MedicineModel> medicines;
  final String diagonsis;
  final String nextAppointment;
  final DateTime createdAt;

  ExaminationModel({
    required this.id,
    required this.name,
    required this.analyses,
    required this.medicines,
    required this.diagonsis,
    required this.nextAppointment,
    required this.createdAt,
  });
  ExaminationModel copyWith({
    String? id,
    String? name,
    List<String>? analyses,
    List<MedicineModel>? medicines,
    String? diagonsis,
    String? nextAppointment,
  }) {
    return ExaminationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      analyses: analyses ?? this.analyses,
      medicines: medicines ?? this.medicines,
      diagonsis: diagonsis ?? this.diagonsis,
      nextAppointment: nextAppointment ?? this.nextAppointment,
      createdAt: createdAt,
    );
  }
}
