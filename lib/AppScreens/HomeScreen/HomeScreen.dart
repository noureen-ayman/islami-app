import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/AppDesigns/AppColors.dart';
import 'package:islami/AppScreens/HomeScreen/HadethScreen/HadethScreen.dart';
import 'package:islami/AppScreens/HomeScreen/QuranScreen/QuranScreen.dart';
import 'package:islami/AppScreens/HomeScreen/RadioScreen/RadioScreen.dart';
import 'package:islami/AppScreens/HomeScreen/SebhaScreen/SebhaScreen.dart';
import 'package:islami/AppScreens/HomeScreen/TimeScreen/TimeScreen.dart';

import '../../AppDesigns/AppLogos/AppLogos.dart';
import '../Common/CostumeScaffoldBackground.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return CostumeScaffoldBackground(
      backGroundImagePath: getBackgroundImage(),
      child: Scaffold(
        body: Column(
          children: [
            SafeArea(
              child: Image.asset(AppLogos.logo, width: screenSize.width * 0.7),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),
                child: tabs[selectedTabIndex],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedTabIndex,
          onTap: (index) {
            setState(() {
              selectedTabIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: AppColors.primary,
              icon: SvgPicture.asset(AppLogos.ic_quran, width: 24, height: 24),
              label: "Quran",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.primary,
              icon: SvgPicture.asset(AppLogos.ic_hadeth, width: 24, height: 24),
              label: "Hadeth",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.primary,
              icon: SvgPicture.asset(AppLogos.ic_sebha, width: 24, height: 24),
              label: "Sebha",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.primary,
              icon: SvgPicture.asset(AppLogos.ic_radio, width: 24, height: 24),
              label: "Radio",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.primary,
              icon: SvgPicture.asset(AppLogos.ic_time, width: 24, height: 24),
              label: "Time",
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> tabs = [
    QuranScreen(),
    HadethScreen(),
    SebhaScreen(),
    RadioScreen(),
    TimeScreen(),
  ];

  String getBackgroundImage() {
    switch (selectedTabIndex) {
      case 0:
        return AppLogos.backGround;
      case 1:
        return AppLogos.hadeth_bg;
      case 2:
        return AppLogos.sebha_bg;
      case 3:
        return AppLogos.radio_bg;
      case 4:
        return AppLogos.time_bg;
      default:
        return AppLogos.backGround;
    }
  }
}
