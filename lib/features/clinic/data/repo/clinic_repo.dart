import 'package:dartz/dartz.dart';
import 'package:doctor_app/features/clinic/data/models/clinic_model.dart';
import '../../../../core/database/api/api_error_model.dart';

abstract class ClinicRepo {
  Future<Either<ApiErrorModel, ClinicModel>> fetchClinicDetails();
}