import 'package:flutter_ngirit/presentation/misc/app_strings.dart';

class OnboardingModel {
  String assetName, description, subDescription;

  OnboardingModel({
    required this.assetName,
    required this.description,
    required this.subDescription,
  });

  static List<OnboardingModel> onboardingSlides = [
    OnboardingModel(
      assetName: '${AppStrings.imagePath}img_onboarding_1.png',
      description: 'Selamat datang di Ngirit!',
      subDescription: 'Mulai atus pengeluaranmu bareng Ngirit!',
    ),
    OnboardingModel(
      assetName: '${AppStrings.imagePath}img_onboarding_2.png',
      description: 'Catat pengeluaranmu',
      subDescription: 'Bantu kamu mengatur budget bulananmu',
    ),
    OnboardingModel(
      assetName: '${AppStrings.imagePath}img_onboarding_3.png',
      description: 'Analisa semua \npengeluaranmu',
      subDescription: 'Bantu kamu mengatur budget bulananmu',
    ),
  ];
}
