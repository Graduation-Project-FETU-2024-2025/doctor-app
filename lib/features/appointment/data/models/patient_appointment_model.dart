

class PatientAppointmentModel {
  final String patientImageUrl;
  final String patientName;
  final String appointmentId;
  final String? patientComment;
  final String status;
  final DateTime time;
  final String patientId;
  final num price;

  PatientAppointmentModel(
      {required this.patientImageUrl,
      required this.patientName,
      required this.appointmentId,
      required this.patientComment,
      required this.status,
      required this.time,
      required this.patientId,
      required this.price});

  factory PatientAppointmentModel.fromJson(Map<String, dynamic> json) {
    return PatientAppointmentModel(
      appointmentId: json['id'],
      time: DateTime.parse(json['date']),
      status: json['status'],
      patientImageUrl: json['userImage'],
      patientId: json['userId'],
      patientName: json['userName'],
      price: json['price'],
      patientComment: 'bla bla',
    );
  }
}
