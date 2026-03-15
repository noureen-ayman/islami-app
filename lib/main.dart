import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/AppDesigns/AppTheme.dart';
import 'package:islami/AppScreens/Common/CachKeys.dart';
import 'package:provider/provider.dart';

import 'AppScreens/Common/MostRecentSharedPreferences.dart';
import 'AppScreens/Common/OnBoardingSharedPreferences.dart';
import 'AppScreens/HomeScreen/HadethScreen/HadethDetailsScreen.dart';
import 'AppScreens/HomeScreen/HomeScreen.dart';
import 'AppScreens/HomeScreen/QuranScreen/ChapterDetails.dart';
import 'AppScreens/HomeScreen/RadioScreen/data/radio_data_source/radio_remote_data_source_impl.dart';
import 'AppScreens/HomeScreen/RadioScreen/presentation/cubit/radio/radio_cubit.dart';
import 'AppScreens/HomeScreen/RadioScreen/presentation/cubit/reciters/reciters_cubit.dart';
import 'AppScreens/IntroScreen/IntroScreen.dart';
import 'Providers/MostRecentProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MostRecentSharedPreferences.init();
  await OnBoardingSharedPreferences.init();
  bool isFirstTime =
      OnBoardingSharedPreferences.getBoolean(CachKeys.isFirstTime) ?? true;
  runApp(IslamiApp(isFirstTime: isFirstTime));
}

class IslamiApp extends StatelessWidget {
  final bool isFirstTime;

  const IslamiApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    MostRecentSharedPreferences.getInstance();
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MostRecentProvider())],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) =>
                RadioCubit(RadioRemoteDataSourceImpl())..getRadioData(),
          ),
          BlocProvider(
            create: (_) =>
                ReciterCubit(RadioRemoteDataSourceImpl())..getReciters(),
          ),
        ],
        child: MaterialApp(
          theme: AppThemes.darkTheme,
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          routes: {
            IntroScreen.route: (context) => const IntroScreen(),
            HomeScreen.route: (context) => const HomeScreen(),
            ChapterDetails.route: (context) => const ChapterDetails(),
            HadethDetails.route: (context) => const HadethDetails(),
          },
          initialRoute: isFirstTime ? IntroScreen.route : HomeScreen.route,
        ),
      ),
    );
  }
}
