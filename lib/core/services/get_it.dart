import 'package:doctor_app/core/database/api/api_consumer.dart';
import 'package:doctor_app/core/database/api/dio_consumer.dart';
import 'package:doctor_app/core/database/api/dio_factory.dart';
import 'package:doctor_app/core/database/cache/cashe_helper.dart';
import 'package:doctor_app/features/auth/data/repository/auth_repo.dart';
import 'package:doctor_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:doctor_app/features/edit_profile/data/repo/edit_profile_repo.dart';
import 'package:doctor_app/features/edit_profile/data/repo/edit_profile_repo_impl.dart';
import 'package:doctor_app/features/examination/data/repos/examination_repo.dart';
import 'package:doctor_app/features/examination/data/repos/examination_repo_impl.dart';
import 'package:doctor_app/features/medicines/data/repos/get_system_medicine_repo.dart';
import 'package:doctor_app/features/medicines/data/repos/get_system_medicine_repo_impl.dart';
import 'package:doctor_app/features/profile/data/repo/profile_repo.dart';
import 'package:doctor_app/features/profile/data/repo/profile_repo_impl.dart';
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
  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<EditProfileRepo>(
    () => EditProfileRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<ExaminationRepo>(
    () => ExaminationRepoImpl(
      apiConsumer: getIt<ApiConsumer>(),
    ),
  );
  getIt.registerLazySingleton<GetSystemMedicinesRepo>(
    () => GetSystemMedicinesRepoImpl(
      apiConsumer: getIt<ApiConsumer>(),
    ),
  );
}
