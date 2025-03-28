import 'package:doctor_app/core/database/cache/cashe_helper.dart';
import 'package:doctor_app/core/global_cubits/change_language_cubit/change_language_cubit.dart';
import 'package:doctor_app/core/global_cubits/change_language_cubit/change_language_state.dart';
import 'package:doctor_app/core/routers/app_router.dart';
import 'package:doctor_app/core/routers/routing.dart';
import 'package:doctor_app/core/services/get_it.dart';
import 'package:doctor_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

class DoctorApp extends StatelessWidget {
  const DoctorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (_, child) {
        return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: Locale(getIt<CacheHelper>().getCurrentLanguage()),
              theme: Themes.lightTheme,
              darkTheme: Themes.darkTheme,
              themeMode: ThemeMode.dark,
              onGenerateRoute: AppRouter.generateRoute,
              initialRoute: Routing.splash,
            );
          },
        );
      },
    );
  }
}
