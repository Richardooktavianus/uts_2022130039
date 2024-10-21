import 'package:flutter/material.dart';


class LoginSetting with ChangeNotifier {
  String _email = '';
  String _password = '';

  set email(String email) {
    _email = email;
    notifyListeners();
  }

  set password(String password) {
    _password = password;
    notifyListeners();
  }

  Future<bool> login() async {
    if (_email == 'neko@neko.com' && _password == 'password123') {
      return true;
    } else {
      return false;
    }
  }
}