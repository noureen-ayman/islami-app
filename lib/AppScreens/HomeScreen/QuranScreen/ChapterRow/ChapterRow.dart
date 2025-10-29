import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:islami/AppScreens/HomeScreen/QuranScreen/ChapterDetails.dart';
import 'package:islami/extentions/context_extentions.dart';

import '../../../../AppDesigns/AppLogos/AppLogos.dart';
import '../SuraDetails/SuraList.dart';

class ChapterRow extends StatelessWidget {
  Chapter chapter;

  ChapterRow({required this.chapter, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ChapterDetails.route, arguments: chapter);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: Svg(AppLogos.suraNumLogo)),
                  ),
                  child: Text(
                    "${chapter.chapterIndex}",
                    style: context.fonts.titleSmall,
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(chapter.englishName, style: context.fonts.titleMedium),
                    const SizedBox(height: 4),
                    Text(
                      "${chapter.verses}  verses",
                      style: context.fonts.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
            Text(chapter.arabicName, style: context.fonts.titleMedium),
          ],
        ),
      ),
    );
  }
}
