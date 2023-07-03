import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ngirit/presentation/pages/main/main_page.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterController {
  bool _isObscuredPassword = true,
      _isObscuredPasswordConfirmation = true,
      _isEmailValid = false,
      _isPasswordValid = false,
      _isPasswordConfirmationValid = false;
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _passwordConfirmationTextController =
      TextEditingController();

  TextEditingController get emailTextController => _emailTextController;
  TextEditingController get passwordTextController => _passwordTextController;
  TextEditingController get passwordConfirmationTextController =>
      _passwordConfirmationTextController;
  bool get isObscuredPassword => _isObscuredPassword;
  bool get isObscuredPasswordConfirmation => _isObscuredPasswordConfirmation;
  bool get emailValid => _isEmailValid;
  bool get passwordValid => _isPasswordValid;
  bool get passwordConfirmationValid => _isPasswordConfirmationValid;

  void toggleVisibilityPassword() {
    _isObscuredPassword = !_isObscuredPassword;
  }

  void toggleVisibilityPasswordConfirmation() {
    _isObscuredPasswordConfirmation = !_isObscuredPasswordConfirmation;
  }

  void validateEmail() {
    _isEmailValid = _emailTextController.text.isNotEmpty;
  }

  void validatePassword() {
    _isPasswordValid = _passwordTextController.text.isNotEmpty;
  }

  void validatePasswordConfirmation() {
    _isPasswordConfirmationValid =
        _passwordConfirmationTextController.text.isNotEmpty;
  }

  bool isBtnEnabled() {
    return _isEmailValid && _isPasswordValid && _isPasswordConfirmationValid;
  }

  void navigateToMain(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const MainPage(),
      ),
    );
  }

  FutureOr<bool> onOpen(String link) async {
    var uri = Uri.parse(link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $link, $uri';
    }
    return true;
  }
}
