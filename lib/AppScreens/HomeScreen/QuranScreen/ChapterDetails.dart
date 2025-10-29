import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/AppDesigns/AppColors.dart';
import 'package:islami/AppDesigns/AppLogos/AppLogos.dart';
import 'package:islami/Providers/MostRecentProvider.dart';
import 'package:islami/extentions/context_extentions.dart';
import 'package:provider/provider.dart';

import '../../Common/CostumeScaffoldBackground.dart';
import 'SuraDetails/SuraList.dart';
import 'SuraDetails/VerseItem.dart';

class ChapterDetails extends StatefulWidget {
  static const String route = "ChapterDetails";

  const ChapterDetails({super.key});

  @override
  State<ChapterDetails> createState() => _ChapterDetailsState();
}

class _ChapterDetailsState extends State<ChapterDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var chapter = ModalRoute.of(context)!.settings.arguments as Chapter;
    Provider.of<MostRecentProvider>(
      context,
      listen: false,
    ).saveChapter(chapter);

    if (verses.isEmpty) {
      loadVerses(chapter.chapterIndex);
    }

    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(centerTitle: true, title: Text(chapter.englishName)),
      body: CostumeScaffoldBackground(
        backGroundImagePath: AppLogos.quranDetailsBg,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Text(
                chapter.arabicName,
                style: context.fonts.titleLarge?.copyWith(
                  color: context.appColors.primary,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 44, bottom: 120),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return VerseItem(verses[index], index + 1);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 2,
                      color: context.appColors.primary,
                      margin: const EdgeInsets.symmetric(horizontal: 32),
                    );
                  },
                  itemCount: verses.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loadVerses(int chapterIndex) async {
    String content = await rootBundle.loadString(
      "assets/sura'sFiles/$chapterIndex.txt",
    );
    List<String> lines = content.trim().split("\n");
    setState(() {
      verses = lines;
    });
  }
}
