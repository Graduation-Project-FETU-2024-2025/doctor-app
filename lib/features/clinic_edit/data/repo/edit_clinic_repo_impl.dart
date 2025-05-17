import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/database/api/end_points.dart';
import 'package:doctor_app/features/clinic_edit/data/models/edit_clinic_model.dart';
import 'package:doctor_app/features/clinic_edit/data/repo/edit_clinic_repo.dart';

import '../../../../core/database/api/api_consumer.dart';
import '../../../../core/database/api/api_error_handler.dart';
import '../../../../core/database/api/api_error_model.dart';

class EditClinicRepoImpl extends EditClinicRepo {
  final ApiConsumer apiConsumer;
  EditClinicRepoImpl(this.apiConsumer);

  @override
  Future<Either<ApiErrorModel, bool>> editClinic(
      EditClinicModel editClinicModel) async {
    try {
      await apiConsumer.put(EndPoints.updateClinic,
          data: editClinicModel.toJson());
      return Right(true);
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
