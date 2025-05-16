import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/database/api/api_error_model.dart';

abstract class BaseUseCase<T, Parameter> {
  Future<Either<ApiErrorModel, T>> call(Parameter param);
}
