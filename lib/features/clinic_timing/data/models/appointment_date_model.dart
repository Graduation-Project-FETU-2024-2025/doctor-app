import 'working_period_model.dart';

class AppointmentDateModel {
  final DateTime date;
  final int appointmentMaxNumber;
  final List<WorkingPeriodModel> workingPeriods;

  AppointmentDateModel({
    required this.date,
    required this.appointmentMaxNumber,
    required this.workingPeriods,
  });

factory AppointmentDateModel.fromJson(Map<String, dynamic> json) {
    return AppointmentDateModel(
      date: DateTime.parse(json['date']),
      appointmentMaxNumber: json['appointmentMaxNumber'],
      workingPeriods: (json['workingPeriods'] as List)
          .map((e) => WorkingPeriodModel.fromJson(e))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(), 
      'appointmentMaxNumber': appointmentMaxNumber,
      'workingPeriods': workingPeriods.map((e) => e.toJson()).toList(),
    };
  }
}