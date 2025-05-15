import 'working_period_model.dart';

class AppointmentDateModel {
  final String id;
  final DateTime date;
  final int appointmentMaxNumber;
  final List<WorkingPeriodModel> workingPeriods;

  AppointmentDateModel({
    required this.id,
    required this.date,
    required this.appointmentMaxNumber,
    required this.workingPeriods,
  });

  factory AppointmentDateModel.fromJson(Map<String, dynamic> json) {
    return AppointmentDateModel(
      id: json['id'],
      date: DateTime.parse(json['date']),
      appointmentMaxNumber: json['appointmentMaxNumber'],
      workingPeriods: (json['workingPeriods'] as List)
          .map((e) => WorkingPeriodModel.fromJson(e))
          .toList(),
    );
  }
}
