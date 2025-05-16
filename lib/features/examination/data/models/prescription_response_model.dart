class PrescriptionResponseModel {
  final String message;
  final int statusCode;

  PrescriptionResponseModel({required this.message, required this.statusCode});
  factory PrescriptionResponseModel.fromJson(Map<String, dynamic> json) {
    return PrescriptionResponseModel(
      message: json['message'],
      statusCode: json['statusCode'],
    );
  }
}
