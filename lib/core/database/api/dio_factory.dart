import 'package:dio/dio.dart';
import 'package:doctor_app/core/database/api/end_points.dart';
import 'package:doctor_app/core/database/cache/cache_keys.dart';
import 'package:doctor_app/core/database/cache/cashe_helper.dart';
import 'package:doctor_app/core/database/cache/secure_storage.dart';
import 'package:doctor_app/core/services/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Dio getDio() {
    if (_dio == null) {
      _dio = Dio();
      _dio!.options.baseUrl = EndPoints.baseUrl;

      _dio!.interceptors
        ..add(_dioInterceptors())
        ..add(_dioInterceptorWrapper());

      return _dio!;
    }
    return _dio!;
  }

  static InterceptorsWrapper _dioInterceptorWrapper() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await SecureStorage.instance.getData(key: ApiKeys.token);
        final lang = getIt<CacheHelper>().getString(key: CacheKeys.currentLanguage)??'en';
        options.headers.addAll({
          'Authorization': token == null ? null : "Bearer $token",
          'lang': lang,
        });
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        return handler.next(e);
      },
    );
  }

  static Interceptor _dioInterceptors() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      request: true,
    );
  }
}
