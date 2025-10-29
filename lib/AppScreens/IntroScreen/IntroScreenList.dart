import '../../AppDesigns/AppLogos/AppLogos.dart';

class IntroScreenList {
  final List<IntroScreenData> introList = [
    IntroScreenData(
      image: AppLogos.arabicWelcome,
      descriptionText: "Welcome To Islami App",
    ),
    IntroScreenData(
      image: AppLogos.kabba,
      tittle: "Welcome To Islami",
      descriptionText: "We Are Very Excited To Have You In Our\n Community",
    ),
    IntroScreenData(
      image: AppLogos.reading,
      tittle: "Reading the Quran",
      descriptionText: 'Read, and your Lord is the Most Generous',
    ),
    IntroScreenData(
      image: AppLogos.bearish,
      tittle: "bearish",
      descriptionText: "Praise the name of your Lord, the Most\n High",
    ),
    IntroScreenData(
      image: AppLogos.radio,
      tittle: "Holy Quran Radio",
      descriptionText:
          "You can listen to the Holy Quran Radio\n through the application for free and easily",
    ),
  ];
}

class IntroScreenData {
  String image;
  String? tittle;
  String descriptionText;

  IntroScreenData({
    required this.image,
    required this.descriptionText,
    this.tittle,
  });
}
