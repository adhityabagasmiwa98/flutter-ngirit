import 'package:flutter/material.dart';
import 'package:flutter_ngirit/presentation/misc/app_colors.dart';
import 'package:flutter_ngirit/presentation/misc/app_sizes.dart';
import 'package:flutter_ngirit/presentation/misc/app_styles.dart';
import 'package:flutter_ngirit/presentation/pages/register/register_controller.dart';
import 'package:flutter_ngirit/presentation/widgets/common_button.dart';
import 'package:flutter_ngirit/presentation/widgets/commont_text_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegisterController _controller;

  @override
  void initState() {
    super.initState();
    _controller = RegisterController();
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
              "Daftar \nAkun",
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
                  _controller.toggleVisibilityPassword();
                });
              },
              textObscured: _controller.isObscuredPassword,
              onChanged: (val) {
                setState(() {
                  _controller.validatePassword();
                });
              },
            ),
            const SizedBox(height: AppSize.dimen12),
            CommonTextInput(
              labelText: "Konfirmasi Password",
              placeholder: "Konfirmasi Password",
              controller: _controller.passwordConfirmationTextController,
              isPassword: true,
              onVisibilityPressed: () {
                setState(() {
                  _controller.toggleVisibilityPasswordConfirmation();
                });
              },
              textObscured: _controller.isObscuredPasswordConfirmation,
              onChanged: (val) {
                setState(() {
                  _controller.validatePasswordConfirmation();
                });
              },
            ),
            const SizedBox(height: AppSize.dimen24),
            CommonButton(
              text: "Daftar",
              textColor: Colors.white,
              backgroundColor: colorPrimary,
              onPressed: () {
                _controller.isBtnEnabled();
              },
              isEnabled: _controller.isBtnEnabled(),
            ),
            const SizedBox(height: AppSize.dimen24),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.onOpen("https://flutter.dev");
                  },
                  child: Text(
                    'syarat dan ketentuan',
                    style: textStyleW400S12.copyWith(
                        decoration: TextDecoration.underline,
                        color: Colors.blue),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
