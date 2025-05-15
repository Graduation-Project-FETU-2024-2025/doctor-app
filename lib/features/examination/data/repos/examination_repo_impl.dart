import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/database/api/api_consumer.dart';
import 'package:doctor_app/core/database/api/api_error_handler.dart';
import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:doctor_app/core/database/api/end_points.dart';
import 'package:doctor_app/features/examination/data/models/prescription_request_model.dart';
import 'package:doctor_app/features/examination/data/models/prescription_response_model.dart';
import 'package:doctor_app/features/examination/data/repos/examination_repo.dart';

class ExaminationRepoImpl implements ExaminationRepo {
  final ApiConsumer apiConsumer;

  ExaminationRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, String>> sendPrescription(
      {required PrescriptionRequestModel requestModel}) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.addPrescription,
        data: requestModel.toJson(),
      );
      final data = PrescriptionResponseModel.fromJson(response.data);
      return right(data.message);
    } catch (e) {
      return left(ApiErrorHandler.handleError(e));
    }
  }
}
