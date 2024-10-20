import 'package:flutter/material.dart';

class LoginSetting with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String get email => emailController.text;
  String get password => passwordController.text;

  Future<bool> login() async {
    // Simulate a login process
    if (email == 'user@example.com' && password == 'password') {
      // Simulate successful login
      return true;
    } else {
      // Simulate failed login
      throw Exception('Invalid email or password');
    }
  }
}