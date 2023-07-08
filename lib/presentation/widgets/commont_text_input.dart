import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ngirit/presentation/misc/app_colors.dart';
import 'package:flutter_ngirit/presentation/misc/app_sizes.dart';
import 'package:flutter_ngirit/presentation/misc/app_styles.dart';

class CommonTextInput extends StatelessWidget {
  final String labelText, placeholder, addonText;
  final TextEditingController controller;
  final bool? isPassword, isNumber, textObscured, withBorderBottom, withAddon;
  final Function()? onVisibilityPressed;
  final Function(String)? onChanged;

  const CommonTextInput({
    super.key,
    this.onVisibilityPressed,
    this.isPassword = false,
    this.isNumber = false,
    this.textObscured = true,
    this.withBorderBottom = false,
    this.withAddon = false,
    this.addonText = "@",
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
          padding: const EdgeInsets.only(bottom: 0, top: 0),
          alignment: Alignment.centerLeft,
          child: Text(
            labelText,
            style: textStyleW400S12.copyWith(
              color: lightBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          keyboardType:
              (isNumber ?? false) ? TextInputType.number : TextInputType.none,
          inputFormatters: (isNumber ?? false)
              ? [FilteringTextInputFormatter.digitsOnly]
              : [],
          decoration: InputDecoration(
            contentPadding: (withBorderBottom ?? false)
                ? const EdgeInsets.symmetric(vertical: 12)
                : const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            hintText: placeholder,
            fillColor: Colors.white,
            prefixIcon: (withAddon ?? false)
                ? Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      addonText,
                      style: textStyleW400S18.copyWith(
                        color: lightBlack,
                      ),
                    ),
                  )
                : null,
            prefixIconConstraints:
                const BoxConstraints(minWidth: 10, minHeight: 0),
            suffixIcon: _suffixIcon(),
            focusedBorder: (withBorderBottom ?? false)
                ? const UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Color(0xff5980F8),
                    ),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSize.dimen8),
                    borderSide: const BorderSide(
                      color: lightBlue,
                      width: 1.0,
                    ),
                  ),
            enabledBorder: (withBorderBottom ?? false)
                ? const UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Color(0xff5980F8),
                    ),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSize.dimen8),
                    borderSide: const BorderSide(
                      color: lightBlue,
                      width: 1.0,
                    ),
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
