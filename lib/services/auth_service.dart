import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';
import 'api_service.dart';
import 'local_storage_service.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
    ref.watch(apiServiceProvider),
    ref.watch(localStorageProvider),
  );
});

class AuthService {
  final ApiService _apiService;
  final LocalStorageService _localStorageService;

  AuthService(this._apiService, this._localStorageService);

  Future<User> loginUser(String email, String password) async {
    try {
      final jsonResponse = await _apiService.postRequest(
        "/surveyor/login",
        data: {
          "email": email,
          "password": password,
        },
      );
      final Map<String, dynamic> data = jsonResponse["data"];
      await _localStorageService.saveToken(data["token"]);
      final User user = await getUserInfo();
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<User> getUserInfo() async {
    try {
      final jsonResponse =
          await _apiService.getRequest("/surveyor", headersRequired: true);
      final user = User.fromJson(jsonResponse["data"]);
      _localStorageService.saveUserDetails(user);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _apiService.postRequest(
        "/surveyor/logout",
        headersRequired: true,
      );
    } catch (e) {
      rethrow;
    }
  }
}
