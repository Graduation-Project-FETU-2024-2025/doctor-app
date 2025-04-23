import 'dart:developer';

import 'package:doctor_app/core/database/cache/cache_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  late SharedPreferences sharedPreferences;
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveData({required String key, required dynamic value}) async {
    if (value is String) {
      await sharedPreferences.setString(key, value);
    } else if (value is int) {
      await sharedPreferences.setInt(key, value);
    } else if (value is double) {
      await sharedPreferences.setDouble(key, value);
    } else if (value is bool) {
      await sharedPreferences.setBool(key, value);
    } else {
      throw Exception('Unsupported value type');
    }

    log('The $key is stored in memory as $value');
  }

  String? getString({required String key}) {
    return sharedPreferences.getString(key);
  }

  int? getInt({required String key}) {
    return sharedPreferences.getInt(key);
  }

  double? getDouble({required String key}) {
    return sharedPreferences.getDouble(key);
  }

  bool? getBool({required String key}) {
    return sharedPreferences.getBool(key);
  }
  Future<void> setCurrentLanguage({required String language}) async {
    sharedPreferences.setString(CacheKeys.currentLanguage, language);
  }
  String getCurrentLanguage() {
    return sharedPreferences.getString(CacheKeys.currentLanguage)??'en';}
}
