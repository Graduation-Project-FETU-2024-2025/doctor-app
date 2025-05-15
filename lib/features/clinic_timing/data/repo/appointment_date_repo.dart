import 'package:dartz/dartz.dart';
import 'package:doctor_app/features/clinic_timing/data/models/appointment_date_model.dart';
import '../../../../core/database/api/api_error_model.dart';

abstract class AppointmentDateRepo {
  Future<Either<ApiErrorModel,List<AppointmentDateModel>>> fetchAppointments();
}
