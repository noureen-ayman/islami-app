import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingSharedPreferences {
  static late SharedPreferences _onBoardingSharedPreferences;

  static Future<void> init() async {
    _onBoardingSharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setBoolean(String key, bool value) {
    return _onBoardingSharedPreferences.setBool(key, value);
  }

  static bool? getBoolean(String key) {
    return _onBoardingSharedPreferences.getBool(key);
  }

  static Future<void> removeData(String key) async {
    await _onBoardingSharedPreferences.remove(key);
  }
}
