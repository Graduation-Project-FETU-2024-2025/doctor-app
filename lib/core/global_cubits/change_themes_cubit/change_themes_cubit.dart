import 'package:doctor_app/core/database/cache/cache_keys.dart';
import 'package:doctor_app/core/database/cache/cashe_helper.dart';
import 'package:doctor_app/core/global_cubits/change_themes_cubit/change_themes_state.dart';
import 'package:doctor_app/core/services/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeThemesCubit extends Cubit<ChangeThemesState> {
  ChangeThemesCubit() : super(ChangeThemesInitial());

  bool isDarkMode = getIt<CacheHelper>().getBool(key: CacheKeys.theme)??false;
  void changeAppTheme() {
    isDarkMode = !isDarkMode;
    getIt<CacheHelper>().saveData(key: CacheKeys.theme,value: isDarkMode);
    emit(ChangeThemesDone());
  }
}
