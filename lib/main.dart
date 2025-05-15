import 'package:doctor_app/core/database/cache/cashe_helper.dart';
import 'package:doctor_app/core/global_cubits/change_language_cubit/change_language_cubit.dart';
import 'package:doctor_app/core/global_cubits/change_themes_cubit/change_themes_cubit.dart';
import 'package:doctor_app/core/helpers/bloc_observer.dart';
import 'package:doctor_app/core/services/get_it.dart';
import 'package:doctor_app/doctor_app.dart';
import 'package:doctor_app/features/examination/data/repos/examination_repo.dart';
import 'package:doctor_app/features/examination/presentation/view_models/examination_cubit/examination_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setup();
  await getIt<CacheHelper>().init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChangeLanguageCubit(),
        ),
        BlocProvider(
          create: (context) => ChangeThemesCubit(),
        ),
        BlocProvider(
            create: (context) => ExaminationCubit(getIt<ExaminationRepo>())),
      ],
      child: const DoctorApp(),
    ),
  );
}
