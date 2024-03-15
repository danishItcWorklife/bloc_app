import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class SecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> writeSecureData(String key, List<int> value) async {
    // Convert List<int> to base64 string
    String base64String = base64Encode(value);

    await _storage.write(key: key, value: base64String);
  }

  Future<List<int>?> readSecureData(String key) async {
    String? base64String = await _storage.read(key: key);
    if (base64String == null) {
      print('No data found for key: $key');
      return null;
    }

    // Convert base64 string back to List<int>
    List<int> value = base64Decode(base64String);

    print('Data read from secure storage: $value');
    return value;
  }

  Future<void> deleteSecureData(String key) async {
    await _storage.delete(key: key);
  }
}
