import 'package:shared_preferences/shared_preferences.dart';

class MostRecentSharedPreferences {
  static const String _chaptersKey = "most_recent";
  late SharedPreferences _sharedPreferences;

  MostRecentSharedPreferences._();

  static MostRecentSharedPreferences? _mostRecentProvider;

  static Future<void> init() async {
    if (_mostRecentProvider == null) {
      _mostRecentProvider = MostRecentSharedPreferences._();
      await _mostRecentProvider?._initSharedPreferences();
    }
  }

  static MostRecentSharedPreferences getInstance() {
    if (_mostRecentProvider == null) {
      throw Exception("make sure to call init before using get Instance");
    }
    return _mostRecentProvider!;
  }

  Future<void> _initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveChapter(int index) async {
    var storedList = (_sharedPreferences.getStringList(_chaptersKey) ?? []);
    storedList.remove("$index");
    storedList.insert(0, "$index");
    await _sharedPreferences.setStringList(_chaptersKey, storedList);
  }

  List<int> getMostRecentChapters() {
    return (_sharedPreferences.getStringList(_chaptersKey) ?? [])
        .map((chapterIndexString) => int.parse(chapterIndexString))
        .toList();
  }
}
