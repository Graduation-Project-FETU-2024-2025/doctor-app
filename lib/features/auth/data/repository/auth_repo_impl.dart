import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/database/api/api_consumer.dart';
import 'package:doctor_app/core/database/api/api_error_handler.dart';
import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:doctor_app/core/database/api/end_points.dart';
import 'package:doctor_app/core/database/cache/cache_keys.dart';
import 'package:doctor_app/core/database/cache/secure_storage.dart';
import 'package:doctor_app/features/auth/data/models/otp_sign_in_response_model.dart';
import 'package:doctor_app/features/auth/data/repository/auth_repo.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiConsumer _apiConsumer;
  AuthRepoImpl(this._apiConsumer);
  @override
  Future<Either<ApiErrorModel, String>> login(String email) async {
    try {
      final response = await _apiConsumer
          .post(EndPoints.signIn, data: {ApiKeys.email: email});
      final message = response.data[ApiKeys.message];
      return Right(message);
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<ApiErrorModel, String>> verifyOTP(otpSignInRequestModel) async {
    try {
      final response = await _apiConsumer.post(EndPoints.otp,
          data: otpSignInRequestModel.toJson());
      final data = OtpSignInResponseModel.fromJson(response.data);
      await _cacheTokenAndId(data.token);
      return Right(data.message);
    } catch (e) {
        return Left(ApiErrorHandler.handleError(e));
    }
  }

  Future<void> _cacheTokenAndId(String token) async {
    await SecureStorage.instance.addData(key: CacheKeys.token, data: token);
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    await SecureStorage.instance
        .addData(key: CacheKeys.id, data: payload['Pharmacy']);//TODO this will change to clinic
  }
}
