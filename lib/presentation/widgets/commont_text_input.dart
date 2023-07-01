import 'package:flutter/material.dart';
import 'package:flutter_ngirit/presentation/misc/app_colors.dart';
import 'package:flutter_ngirit/presentation/misc/app_sizes.dart';
import 'package:flutter_ngirit/presentation/misc/app_styles.dart';

class CommonTextInput extends StatelessWidget {
  final String labelText, placeholder;
  final TextEditingController controller;
  final bool? isPassword, textObscured;
  final Function()? onVisibilityPressed;
  final Function(String)? onChanged;
  const CommonTextInput({
    super.key,
    this.onVisibilityPressed,
    this.isPassword = false,
    this.textObscured = true,
    this.onChanged,
    required this.labelText,
    required this.placeholder,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 5, top: 5),
          alignment: Alignment.centerLeft,
          child: Text(labelText,
              style: textStyleW400S12.copyWith(color: lightBlack)),
        ),
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            hintText: placeholder,
            fillColor: Colors.white,
            suffixIcon: _suffixIcon(),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.dimen8),
              borderSide: const BorderSide(color: lightBlue, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.dimen8),
              borderSide: const BorderSide(color: lightBlue, width: 1.0),
            ),
          ),
          obscureText: _showPassword(),
        )
      ],
    );
  }

  Widget? _suffixIcon() {
    if (isPassword ?? false) {
      return IconButton(
        onPressed: isPassword ?? false ? onVisibilityPressed : null,
        icon: textObscured ?? false
            ? const Icon(
                Icons.visibility_off,
              )
            : const Icon(
                Icons.visibility,
              ),
      );
    }
    return null;
  }

  bool _showPassword() {
    if (isPassword ?? false) {
      return textObscured ?? false;
    }
    return false;
  }
}
