import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage._privateConstructor();

  static final SecureStorage instance = SecureStorage._privateConstructor();

  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  Future<void> addData({required String key, required String data}) async {
    await _flutterSecureStorage.write(key: key, value: data);
  }

  Future<String?>? getData({required String key}) async {
    return await _flutterSecureStorage.read(key: key);
  }
}
