import 'package:flutter/material.dart';
import 'package:islami/extentions/context_extentions.dart';

class VerseItem extends StatelessWidget {
  String verse;
  int index;

  VerseItem(this.verse, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      alignment: Alignment.center,
      child: Text(
        "$verse {$index}",
        style: context.fonts.bodyLarge?.copyWith(
          color: context.appColors.primary,
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
