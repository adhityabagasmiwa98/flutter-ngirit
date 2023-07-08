import 'package:flutter/material.dart';
import 'package:flutter_ngirit/presentation/misc/app_styles.dart';

import '../misc/app_colors.dart';

class CommonButton extends StatelessWidget {
  final Color backgroundColor, textColor;
  final String text;
  final double width, height;
  final Function() onPressed;
  final bool? isEnabled;

  const CommonButton({
    super.key,
    this.isEnabled = true,
    this.width = double.infinity,
    this.height = 38,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnabled ?? true ? backgroundColor : disabledButton,
        fixedSize: Size(width, height),
      ),
      onPressed: isEnabled ?? true ? onPressed : null,
      child: Text(
        text,
        style: textStyleW700S18.copyWith(
          color: textColor,
        ),
      ),
    );
  }
}
