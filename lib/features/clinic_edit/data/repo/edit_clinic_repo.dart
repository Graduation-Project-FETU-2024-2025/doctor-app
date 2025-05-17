import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:doctor_app/features/clinic_edit/data/models/edit_clinic_model.dart';

abstract class EditClinicRepo {
  Future<Either<ApiErrorModel,void>> editClinic(EditClinicModel editClinicModel);
}