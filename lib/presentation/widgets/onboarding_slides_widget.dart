import 'package:flutter/material.dart';
import 'package:flutter_ngirit/presentation/misc/app_colors.dart';
import 'package:flutter_ngirit/presentation/misc/app_sizes.dart';
import 'package:flutter_ngirit/presentation/misc/app_styles.dart';
import 'package:flutter_ngirit/presentation/widgets/common_button.dart';

class OnboardingSlides extends StatelessWidget {
  final String assetName, description, subDescription;
  final Function() onPressSkip, onPressedButton;
  final bool isShowSkipButton, isShowLoginButton;

  const OnboardingSlides({
    super.key,
    required this.assetName,
    required this.description,
    required this.subDescription,
    required this.onPressSkip,
    required this.onPressedButton,
    required this.isShowSkipButton,
    required this.isShowLoginButton,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isShowSkipButton)
          Positioned(
            top: 24,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: onPressSkip,
                  child: Text(
                    'Lewati',
                    style: textStyleW500S12.copyWith(
                      color: colorPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: AppSize.dimen48),
            Image.asset(assetName),
            const SizedBox(height: AppSize.dimen48),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.dimen24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    style: textStyleW700S24.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: AppSize.dimen8),
                  Text(
                    subDescription,
                    style: textStyleW400S12.copyWith(color: lightBlack),
                  ),
                ],
              ),
            ),
            if (isShowLoginButton) ...[
              const SizedBox(height: AppSize.dimen48),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.dimen24,
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: CommonButton(
                    text: 'Masuk',
                    textColor: Colors.white,
                    backgroundColor: colorPrimary,
                    onPressed: onPressedButton,
                  ),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
