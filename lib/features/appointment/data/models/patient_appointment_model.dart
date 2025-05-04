class PatientAppointmentModel {
  final String patientImageUrl;
  final String patientName;
  final String patientComment;
  final String startTime;
  final String endTime;
  final String date;

  PatientAppointmentModel({
    required this.patientImageUrl,
    required this.patientName,
    required this.patientComment,
    required this.startTime,
    required this.endTime,
    required this.date,
  });
}
