import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ngirit/presentation/misc/app_colors.dart';
import 'package:flutter_ngirit/presentation/pages/form_screen/form_screen_controller.dart';
import 'package:flutter_ngirit/presentation/pages/form_screen/form_screen_page.dart';
import 'package:flutter_ngirit/presentation/pages/splash_screen/splash_screen_page.dart';
import 'package:provider/provider.dart';

import 'presentation/pages/onboarding/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FormScreenController()),
      ],
      child: MaterialApp(
        title: 'Ngirit',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: colorPrimary),
          useMaterial3: false,
        ),
        home: const OnboardingPage(),
      ),
    );
  }
}
