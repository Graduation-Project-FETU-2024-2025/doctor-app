import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:doctor_app/features/medicines/data/models/system_medicine_response_model.dart';

abstract class GetSystemMedicinesRepo {
  Future<Either<ApiErrorModel, SystemMedicineResponseModel>>
      getSystemMedicines();
  Future<Either<ApiErrorModel, SystemMedicineResponseModel>>
      searchInSystemMedicines({required String query});
}
