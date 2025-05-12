import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/database/api/api_consumer.dart';
import 'package:doctor_app/core/database/api/api_error_handler.dart';
import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:doctor_app/core/database/api/end_points.dart';
import 'package:doctor_app/core/database/cache/cache_keys.dart';
import 'package:doctor_app/core/database/cache/cashe_helper.dart';
import 'package:doctor_app/core/services/get_it.dart';
import 'package:doctor_app/features/profile/data/models/user_model.dart';
import 'package:doctor_app/features/profile/data/repo/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiConsumer _apiConsumer;

  ProfileRepoImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;
  @override
  Future<Either<ApiErrorModel, UserModel>> getUserInfo() async {
    try {
      final response = await _apiConsumer.get(EndPoints.getProfile);
      await _cacheUserInfo(response.data);
      return right(UserModel.fromJson(response.data));
    } catch (e) {
      return left(ApiErrorHandler.handleError(e));
    }
  }

  Future _cacheUserInfo(data) async {
    await Future.wait([
      getIt<CacheHelper>()
          .saveData(key: CacheKeys.username, value: data['name']),
      getIt<CacheHelper>()
          .saveData(key: CacheKeys.profileImage, value: data['picture']),
    ]);
  }
}
