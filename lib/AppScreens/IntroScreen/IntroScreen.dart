import 'package:flutter/material.dart';
import 'package:islami/AppDesigns/AppColors.dart';
import 'package:islami/AppScreens/Common/CachKeys.dart';
import 'package:islami/AppScreens/HomeScreen/HomeScreen.dart';
import 'package:islami/extentions/context_extentions.dart';

import '../../AppDesigns/AppLogos/AppLogos.dart';
import '../Common/OnBoardingSharedPreferences.dart';
import 'IntroScreenList.dart';

class IntroScreen extends StatefulWidget {
  static const String route = "IntroScreen";

  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late PageController _pageController;
  int currentIndex = 0;

  List<IntroScreenData> introList = IntroScreenList().introList;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        toolbarHeight: 151,
        backgroundColor: AppColors.grey,
        centerTitle: true,
        title: Image.asset(AppLogos.logo),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: introList.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 14),
                    Image.asset(
                      introList[index].image,
                      width: 398,
                      height: 415,
                    ),
                    const SizedBox(height: 39.5),
                    if (introList[index].tittle != null)
                      Text(
                        introList[index].tittle!,
                        style: context.fonts.titleLarge?.copyWith(
                          color: AppColors.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    const SizedBox(height: 39.5),
                    Text(
                      introList[index].descriptionText,
                      style: context.fonts.titleMedium?.copyWith(
                        color: AppColors.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentIndex != 0)
                  InkWell(
                    onTap: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.linear,
                      );
                    },
                    child: Text(
                      "Back",
                      style: context.fonts.bodySmall?.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  )
                else
                  const SizedBox(width: 30),
                Row(
                  children: List.generate(introList.length, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 16,
                      ),
                      width: currentIndex == index ? 24 : 8,
                      height: currentIndex == index ? 10 : 8,
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? AppColors.primary
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    );
                  }),
                ),
                InkWell(
                  onTap: () {
                    if (currentIndex == introList.length - 1) {
                      OnBoardingSharedPreferences.setBoolean(
                        CachKeys.isFirstTime,
                        false,
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.linear,
                      );
                    }
                  },
                  child: Text(
                    currentIndex == introList.length - 1 ? "Finish" : "Next",
                    style: context.fonts.bodySmall?.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
