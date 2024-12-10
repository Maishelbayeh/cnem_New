import 'package:get_storage/get_storage.dart';

class StorageService {
  final GetStorage _storage = GetStorage();

  // Save a string value
  Future<void> saveString(String key, String value) async {
    //print("//print sane email $value");
    await _storage.write(key, value);
  }

  // Load a string value
  String? loadString(String key) {
    //print("//print load email $key");
    return _storage.read<String>(key);
  }

  // Save a boolean value
  Future<void> saveBool(String key, bool value) async {
    //print("bool $value");
    await _storage.write(key, value);
  }

  // Load a boolean value
  bool? loadBool(String key) {
    //print("bool $key");
    return _storage.read<bool>(key);
  }

  // Clear a specific key
  Future<void> clearKey(String key) async {
    await _storage.remove(key);
  }

  // Clear all keys (use with caution)
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
