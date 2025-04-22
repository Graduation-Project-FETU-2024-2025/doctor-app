import 'package:doctor_app/core/database/cache/cache_keys.dart';
import 'package:doctor_app/core/database/cache/cashe_helper.dart';
import 'package:doctor_app/core/global_cubits/change_language_cubit/change_language_state.dart';
import 'package:doctor_app/core/services/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit() : super(ChangeLanguageInitial());
  static ChangeLanguageCubit get(context) => BlocProvider.of(context);
  String arabic = 'ar';
  String english = 'en';
  Future<void> changeLanguage({required String language}) async {
    await getIt<CacheHelper>()
        .saveData(key: CacheKeys.currentLanguage, value: language);

    emit(ChangeLanguageDone());
  }
}
