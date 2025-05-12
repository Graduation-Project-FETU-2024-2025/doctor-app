import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:doctor_app/features/profile/data/models/user_model.dart';

abstract class ProfileRepo {
  Future<Either<ApiErrorModel, UserModel>> getUserInfo();
}
