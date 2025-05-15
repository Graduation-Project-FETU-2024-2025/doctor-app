import 'package:doctor_app/features/medicines/data/models/system_medicine_model.dart';

class SystemMedicineResponseModel {
  final String message;
  final int statusCode;
  final List<SystemMedicineModel> data;

  SystemMedicineResponseModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory SystemMedicineResponseModel.fromJson(Map<String, dynamic> json) {
    return SystemMedicineResponseModel(
      message: json['message'],
      statusCode: json['statusCode'],
      data: (json['data'] as List)
          .map((e) => SystemMedicineModel.fromJson(e))
          .toList(),
    );
  }
}
