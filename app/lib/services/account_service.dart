import 'package:app/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AccountService {
  static const _secureStorage = FlutterSecureStorage();

  static Future<User?> loadUserData() async {
    String? id;
    String? token;
    try {
      id = await _secureStorage.read(key: 'user-id');
      token = await _secureStorage.read(key: 'user-token');
    } catch (error) {
      throw Exception('Failed to load user data');
    }
    if (id != null && token != null) {
      return User(userId: int.parse(id), userToken: token);
    }
  }

  static Future<void> saveUserData(User user) async {
    try {
      _secureStorage.write(key: 'user-id', value: user.userId.toString());
      _secureStorage.write(key: 'user-token', value: user.userToken);
    } catch (error) {
      throw Exception('Failed to save user data');
    }
  }

  static Future<void> deleteUserData() async {
    try {
      await _secureStorage.delete(key: 'user-id');
      await _secureStorage.delete(key: 'user-token');
    } catch (error) {
      throw Exception('Failed to delete user data');
    }
  }
}
