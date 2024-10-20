import 'package:flutter/material.dart';

class LoginSetting with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String get email => emailController.text;
  String get password => passwordController.text;

  bool get isValidEmail {
    return email.contains('@') && email.contains('.');
  }

  bool get isValidPassword {
    return password.length >= 6;
  }

  bool? get loggedIn => null;

  void login() {
    // Buat instance User menggunakan email dan password
  }
}

