import 'package:flutter/material.dart';
import 'package:flutter_ngirit/presentation/misc/app_styles.dart';

class CommonButton extends StatelessWidget {
  final Color backgroundColor, textColor;
  final String text;
  final Function() onPressed;

  const CommonButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyleW500S12.copyWith(
          color: textColor,
        ),
      ),
    );
  }
}
