import 'package:dosaan/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';

final loginProvider =
    StateNotifierProvider<LoginNotifier, AsyncValue<User?>>((ref) {
  return LoginNotifier(ref.watch(authServiceProvider));
});

class LoginNotifier extends StateNotifier<AsyncValue<User?>> {
  String? _email;
  String? _password;
  final AuthService _authService;
  LoginNotifier(this._authService) : super(const AsyncValue.data(null));

  Future<void> login() async {
    try {
      state = const AsyncValue.loading();
      final user = await _authService.loginUser(_email!, _password!);
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> logout() async {
    try {
      state = const AsyncValue.loading();
      await _authService.logout();
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void onSaveUsername(String? email) {
    _email = email;
  }

  void onSavePassword(String? password) {
    _password = password;
  }
}
