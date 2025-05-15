import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:doctor_app/features/examination/data/models/prescription_request_model.dart';

abstract class ExaminationRepo {
  Future<Either<ApiErrorModel, String>> sendPrescription(
      {required PrescriptionRequestModel requestModel});
}
