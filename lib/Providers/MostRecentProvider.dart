import 'package:flutter/material.dart';

import '../AppScreens/Common/MostRecentSharedPreferences.dart';
import '../AppScreens/HomeScreen/QuranScreen/SuraDetails/SuraList.dart';

class MostRecentProvider extends ChangeNotifier {
  late MostRecentSharedPreferences mostRecentSharedPreferences;
  late List<Chapter> _mostRecentChapters;

  List<Chapter> getMostRecentChapters() {
    return _mostRecentChapters;
  }

  MostRecentProvider() {
    mostRecentSharedPreferences = MostRecentSharedPreferences.getInstance();
    _mostRecentChapters = [];
    refreshMostRecentChapters();
  }

  void saveChapter(Chapter chapter) async {
    await mostRecentSharedPreferences.saveChapter(chapter.chapterIndex);
    refreshMostRecentChapters();
  }

  void refreshMostRecentChapters() {
    _mostRecentChapters = [];
    var savedChaptersIndicesList = mostRecentSharedPreferences
        .getMostRecentChapters();
    for (var chapterIndex in savedChaptersIndicesList) {
      var chapter = Chapter.chapters[chapterIndex - 1];
      _mostRecentChapters.add(chapter);
    }
    notifyListeners();
  }
}
