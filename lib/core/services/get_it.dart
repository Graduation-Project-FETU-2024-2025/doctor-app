import 'package:doctor_app/core/database/api/api_consumer.dart';
import 'package:doctor_app/core/database/api/dio_consumer.dart';
import 'package:doctor_app/core/database/api/dio_factory.dart';
import 'package:doctor_app/core/database/cache/cashe_helper.dart';
import 'package:doctor_app/features/auth/data/repository/auth_repo.dart';
import 'package:doctor_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  /// CacheHelper instance
  getIt.registerLazySingleton<CacheHelper>(
    () => CacheHelper(),
  );

  // api data

  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(dio: DioFactory.getDio()),
  );

  // Auth repos

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      getIt<ApiConsumer>(),
    ),
  );
}
