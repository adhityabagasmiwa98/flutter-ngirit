import 'package:flutter/material.dart';
import 'package:flutter_ngirit/presentation/misc/app_colors.dart';
import 'package:flutter_ngirit/presentation/misc/app_sizes.dart';
import 'package:flutter_ngirit/presentation/misc/app_styles.dart';
import 'package:flutter_ngirit/presentation/pages/login/login_controller.dart';
import 'package:flutter_ngirit/presentation/widgets/common_button.dart';
import 'package:flutter_ngirit/presentation/widgets/commont_text_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController _controller;

  @override
  void initState() {
    super.initState();
    _controller = LoginController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.dimen12),
        child: ListView(
          children: [
            Text(
              "Selamat \nDatang",
              style: textStyleW700S54.copyWith(
                color: colorPrimary,
              ),
            ),
            const SizedBox(height: AppSize.dimen12),
            CommonTextInput(
              labelText: "Email",
              placeholder: "Email",
              controller: _controller.emailTextController,
              onChanged: (val) {
                setState(() {
                  _controller.validateEmail();
                });
              },
            ),
            const SizedBox(height: AppSize.dimen12),
            CommonTextInput(
              labelText: "Password",
              placeholder: "Password",
              controller: _controller.passwordTextController,
              isPassword: true,
              onVisibilityPressed: () {
                setState(() {
                  _controller.toggleVisibility();
                });
              },
              onChanged: (val) {
                setState(() {
                  _controller.validatePassword();
                });
              },
              textObscured: _controller.isObscured,
            ),
            const SizedBox(height: AppSize.dimen24),
            CommonButton(
              text: "Masuk",
              textColor: Colors.white,
              backgroundColor: colorPrimary,
              onPressed: () {
                _controller.navigateToMain(context);
              },
              isEnabled: _controller.isBtnEnabled(),
            ),
            const SizedBox(height: AppSize.dimen12),
            Center(
              child: GestureDetector(
                onTap: () {
                  _controller.navigateToRegister(context);
                },
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Belum punya akun? ",
                          style: textStyleW600S12.copyWith(
                            color: lightBlack,
                          )),
                      TextSpan(
                          text: "Daftar!",
                          style: textStyleW600S12.copyWith(
                            color: colorPrimary,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
