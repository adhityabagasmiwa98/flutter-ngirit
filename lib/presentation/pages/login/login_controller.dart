import 'package:flutter/material.dart';
import 'package:flutter_ngirit/presentation/pages/main/main_page.dart';
import 'package:flutter_ngirit/presentation/pages/register/register_page.dart';

class LoginController {
  bool _isObscured = true, _emailValid = false, _passwordValid = false;
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  TextEditingController get emailTextController => _emailTextController;
  TextEditingController get passwordTextController => _passwordTextController;
  bool get isObscured => _isObscured;
  bool get emailValid => _emailValid;
  bool get passwordValid => _passwordValid;

  void toggleVisibility() {
    _isObscured = !_isObscured;
  }

  void navigateToRegister(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const RegisterPage(),
      ),
    );
  }

  void navigateToMain(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const MainPage(),
      ),
    );
  }

  void validateEmail() {
    _emailValid = _emailTextController.text.isNotEmpty;
  }

  void validatePassword() {
    _passwordValid = _passwordTextController.text.isNotEmpty;
  }

  bool isBtnEnabled() {
    return _emailValid && _passwordValid;
  }
}
