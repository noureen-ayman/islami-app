import 'package:flutter/material.dart';
import 'package:islami/AppDesigns/AppColors.dart';
import 'package:islami/AppDesigns/AppLogos/AppLogos.dart';
import 'package:islami/extentions/context_extentions.dart';

import '../../Common/CostumeScaffoldBackground.dart';
import 'Hadeth.dart';

class HadethDetails extends StatelessWidget {
  static const String route = "HadethDetails";

  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final hadeth = args['hadeth'] as Hadeth;
    final index = args['index'] as int;

    final List<String> hadethLines = hadeth.content.trim().split("\n");

    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(centerTitle: true, title: Text("Hadeth ${index + 1}")),
      body: CostumeScaffoldBackground(
        backGroundImagePath: AppLogos.quranDetailsBg,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Text(
                hadeth.tittle,
                style: context.fonts.titleLarge?.copyWith(
                  color: context.appColors.primary,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 44,
                  bottom: 120,
                  right: 40,
                  left: 40,
                ),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Text(
                      hadethLines[index],
                      style: context.fonts.titleMedium?.copyWith(
                        color: context.appColors.primary,
                        height: 2,
                      ),
                      textAlign: TextAlign.center,
                    );
                  },
                  itemCount: hadethLines.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
