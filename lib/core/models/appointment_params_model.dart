import 'package:doctor_app/core/enums/appointment_state_enum.dart';
import 'package:doctor_app/core/enums/visit_type_enum.dart';

class AppointmentParamsModel {
  final String? date;
  final AppointmentStateEnum? appointmentState;
  final VisitTypeEnum? visitType;

  AppointmentParamsModel({this.date, this.appointmentState, this.visitType});

  Map<String, dynamic> toJson() {
    
    return {
     if(date!=null) 'appointmentDate':date,
     if(appointmentState!=null) 'status':appointmentState!.status,
     if(visitType!=null) 'type':visitType!.type
    };
  }
}
