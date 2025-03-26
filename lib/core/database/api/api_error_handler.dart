import 'package:dio/dio.dart';
import 'package:doctor_app/core/database/api/api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: 'Connection timeout');
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(message: 'Send timeout');
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(message: 'Receive timeout');
        case DioExceptionType.badCertificate:
          return ApiErrorModel(message: 'Bad certificate');
        case DioExceptionType.badResponse:
          return _handleError(error.response!.data);
        case DioExceptionType.cancel:
          return ApiErrorModel(message: 'Request cancelled');
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: 'Connection error');
        case DioExceptionType.unknown:
          return ApiErrorModel(message: 'Unknown error');
      }
    } else {
      return ApiErrorModel(message:  'An error occurred',);
    }
  }
  
  static ApiErrorModel _handleError(data) {
     return ApiErrorModel(
      statusCode: data['statusCode'],
      message: ApiErrorModel.getAllErrorMessage(data['message'], data['errors']),
      errors: data['data'],
    );
  }
}
