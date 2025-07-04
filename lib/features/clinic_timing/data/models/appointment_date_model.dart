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

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(), 
      'appointmentMaxNumber': appointmentMaxNumber,
      'workingPeriods': workingPeriods.map((e) => e.toJson()).toList(),
    };
  }
}