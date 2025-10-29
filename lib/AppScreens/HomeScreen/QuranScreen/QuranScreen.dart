import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/AppScreens/HomeScreen/QuranScreen/ChapterRow/ChapterRow.dart';
import 'package:islami/extentions/context_extentions.dart';

import '../../../AppDesigns/AppLogos/AppLogos.dart';
import 'MostRecently/MostRecently.dart';
import 'SuraDetails/SuraList.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  final List<Chapter> chapters = Chapter.chapters;
  List<Chapter> filterdChapters = [];

  @override
  void initState() {
    super.initState();
    filterdChapters = chapters;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextField(
          onChanged: (text) {
            filterChapters(text.toLowerCase());
          },
          decoration: InputDecoration(
            hintText: "Sura Name",
            labelText: "Sura Name",
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                AppLogos.quranSearchLogo,
                width: 24.5,
                height: 28,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        MostRecently(),
        const SizedBox(height: 12),
        Text("Sura List", style: context.fonts.titleMedium),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ChapterRow(chapter: filterdChapters[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(6),
                height: 2,
                color: Colors.white,
              );
            },
            itemCount: filterdChapters.length,
          ),
        ),
      ],
    );
  }

  void filterChapters(String text) {
    List<Chapter> filterList = [];
    for (int i = 0; i < chapters.length; i++) {
      if (chapters[i].englishName.toLowerCase().contains(text) ||
          chapters[i].arabicName.toLowerCase().contains(text)) {
        filterList.add(chapters[i]);
      }
    }
    setState(() {
      filterdChapters = filterList;
    });
  }
}
