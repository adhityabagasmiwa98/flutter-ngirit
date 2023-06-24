import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ngirit/presentation/pages/onboarding/onboarding_page.dart';

class SplashScreenController {
  Future<Timer> startSplashScreen(BuildContext context) async {
    var duration = const Duration(seconds: 2);

    return Timer(duration, () {
      _navigateToHome(context);
    });
  }

  void _navigateToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const OnboardingPage(),
      ),
    );
  }
}
