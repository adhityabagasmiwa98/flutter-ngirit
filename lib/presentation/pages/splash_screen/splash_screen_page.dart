import 'package:flutter/material.dart';
import 'package:flutter_ngirit/presentation/misc/app_colors.dart';
import 'package:flutter_ngirit/presentation/misc/app_strings.dart';
import 'package:flutter_ngirit/presentation/pages/splash_screen/splash_screen_controller.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  late final SplashScreenController _controller;

  @override
  void initState() {
    super.initState();

    _controller = SplashScreenController();
    _controller.startSplashScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 1.0],
              colors: [
                colorPrimary,
                darkBlue,
              ],
            ),
          ),
          child: Center(
            child: Image.asset('${AppStrings.imagePath}img_app_logo.png'),
          ),
        ),
      ),
    );
  }
}
