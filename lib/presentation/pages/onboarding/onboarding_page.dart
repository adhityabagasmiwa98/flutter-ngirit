import 'package:flutter/material.dart';
import 'package:flutter_ngirit/presentation/misc/app_colors.dart';
import 'package:flutter_ngirit/presentation/misc/app_sizes.dart';
import 'package:flutter_ngirit/presentation/pages/onboarding/onboarding_controller.dart';
import 'package:flutter_ngirit/presentation/widgets/onboarding_slides_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late OnboardingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = OnboardingController();
    _controller.setPageController(0);
  }

  Widget _buildDot({
    required BuildContext context,
    required index,
  }) {
    return Container(
      height: AppSize.dimen8,
      width:
          _controller.currentIndex == index ? AppSize.dimen12 : AppSize.dimen8,
      margin: const EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.radius20),
        color: _controller.currentIndex == index ? colorPrimary : darkBlack,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _controller.slides.length,
                onPageChanged: (value) {
                  setState(() {
                    _controller.setCurrentIndex(value);
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingSlides(
                    assetName: _controller.slides[index].assetName,
                    description: _controller.slides[index].description,
                    subDescription: _controller.slides[index].subDescription,
                    onPressSkip: () => {},
                    onPressedButton: () => {},
                    isShowLoginButton: _controller.currentIndex ==
                        (_controller.slides.length - 1),
                    isShowSkipButton: _controller.currentIndex !=
                        (_controller.slides.length - 1),
                  );
                },
              ),
            ),
            if (_controller.currentIndex !=
                (_controller.slides.length - 1)) ...[
              Padding(
                padding: const EdgeInsets.only(
                  right: AppSize.dimen24,
                  bottom: AppSize.dimen100,
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(
                        _controller.slides.length,
                        (index) => _buildDot(context: context, index: index),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
