import 'dart:convert';
import 'package:cenem/model/userModel.dart';
import 'package:get_storage/get_storage.dart';

class UserService {
  final GetStorage _storage = GetStorage();
  final String _key = 'user';

  // Save the User object to storage
  Future<void> saveUser(User user) async {
    String userJson = jsonEncode(user.toJson());
    await _storage.write(_key, userJson);
  }

  // Load the User object from storage
  User? loadUser() {
    String? userJson = _storage.read<String>(_key);
    if (userJson != null) {
      return User.fromJson(jsonDecode(userJson));
    }
    return null;
  }

  // Clear the User object from storage
  Future<void> clearUser() async {
    await _storage.remove(_key);
  }
}
