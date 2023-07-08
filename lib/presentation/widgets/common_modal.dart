import 'package:flutter/material.dart';
import 'package:flutter_ngirit/presentation/misc/app_styles.dart';

class CommonModal extends StatelessWidget {
  final String image;
  final String message;

  const CommonModal({
    Key? key,
    required this.image,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 0.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 94,
          left: 77,
          right: 77,
          bottom: 25,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              image, // Replace with your own image path
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            Text(
              message,
              textAlign: TextAlign.center,
              style: textStyleW700S24.copyWith(),
            ),
          ],
        ),
      ),
    );
  }
}
