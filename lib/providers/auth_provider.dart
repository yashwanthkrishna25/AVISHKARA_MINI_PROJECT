import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _service = AuthService();

  bool loading = false;

  bool get isLoading => loading;

  Future login(
      String email,
      String password) async {
    loading = true;
    notifyListeners();

    await _service.login(
      email: email,
      password: password,
    );

    loading = false;
    notifyListeners();
  }

  Future signup(
      String email,
      String password) async {
    loading = true;
    notifyListeners();

    await _service.signUp(
      email: email,
      password: password,
    );

    loading = false;
    notifyListeners();
  }

  Future logout() async {
    await _service.logout();
  }
}