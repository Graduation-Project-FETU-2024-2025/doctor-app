import 'package:doctor_app/features/examination/data/models/prescription_product_dto.dart';

class PrescriptionRequestModel {
  final String doctorId;
  final String appointmentId;
  final String tests;
  final String diagnosis;
  final String nextAppointment;
  final List<PrescriptionProductDto> prescriptionProductDTOs;

  PrescriptionRequestModel({
    required this.doctorId,
    required this.appointmentId,
    required this.tests,
    required this.diagnosis,
    required this.nextAppointment,
    required this.prescriptionProductDTOs,
  });
  Map<String, dynamic> toJson() {
    return {
      'DoctorId': doctorId,
      'appointmentId': appointmentId,
      'tests': tests,
      'diagnosis': diagnosis,
      'nextAppointment': nextAppointment,
      'prescriptionProductDTOs':
          prescriptionProductDTOs.map((e) => e.toJson()).toList(),
    };
  }
}
