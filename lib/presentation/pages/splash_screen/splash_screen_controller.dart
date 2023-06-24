import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ngirit/presentation/pages/onboarding/onboarding_page.dart';

class SplashScreenController {
  Timer startSplashScreen(BuildContext context) {
    var duration = const Duration(seconds: 2);

    return Timer(duration, () {
      _navigateToOnboard(context);
    });
  }

  void _navigateToOnboard(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const OnboardingPage(),
      ),
    );
  }
}
