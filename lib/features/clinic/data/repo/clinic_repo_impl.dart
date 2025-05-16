
import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/database/cache/secure_storage.dart';
import 'package:doctor_app/features/clinic/data/models/clinic_model.dart';
import '../../../../core/database/api/api_consumer.dart';
import '../../../../core/database/api/api_error_handler.dart';
import '../../../../core/database/api/api_error_model.dart';
import '../../../../core/database/api/end_points.dart';
import '../../../../core/database/cache/cache_keys.dart';
import 'clinic_repo.dart';

class ClinicRepoImpl implements ClinicRepo {
  final ApiConsumer apiConsumer;

  ClinicRepoImpl({required this.apiConsumer});

  @override
  Future<Either<ApiErrorModel, ClinicModel>> fetchClinicDetails() async {

    final clinicId = await SecureStorage.instance.getData(key: CacheKeys.id);
    try {
      final response = await apiConsumer.get('${EndPoints.getClinic}$clinicId');
      if (response.statusCode == 200) {
        final dataJson = response.data['data'];
        final clinicData = ClinicModel.fromJson(dataJson);
        return Right(clinicData);
      } else {
        return Left(ApiErrorHandler.handleError('Error Loading Clinic Details'));
      }
    } on Exception catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}