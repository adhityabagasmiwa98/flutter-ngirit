import 'package:flutter/material.dart';
import 'package:flutter_ngirit/domain/onboarding_domain.dart';
import 'package:flutter_ngirit/presentation/pages/login/login_page.dart';

class OnboardingController {
  late PageController _pageController;
  PageController get pageController => _pageController;

  final List<OnboardingModel> _slides = OnboardingModel.onboardingSlides;
  List<OnboardingModel> get slides => _slides;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setCurrentIndex(int currentIndex) {
    _currentIndex = currentIndex;
  }

  void setPageController(int initalPage) {
    _pageController = PageController(initialPage: initalPage);
  }

  void navigateToLogin(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }
}
