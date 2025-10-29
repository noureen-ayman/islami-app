import 'package:flutter/material.dart';
import 'package:islami/extentions/context_extentions.dart';
import 'package:provider/provider.dart';

import '../../../../AppDesigns/AppColors.dart';
import '../../../../AppDesigns/AppLogos/AppLogos.dart';
import '../../../../Providers/MostRecentProvider.dart';

class MostRecently extends StatefulWidget {
  const MostRecently({super.key});

  @override
  State<MostRecently> createState() => _MostRecentlyState();
}

class _MostRecentlyState extends State<MostRecently> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MostRecentProvider provider = Provider.of<MostRecentProvider>(context);
    var visitedChapters = provider.getMostRecentChapters();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Most Recently", style: context.fonts.titleMedium),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(5),
                width: 283,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.primary,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            visitedChapters[index].englishName,
                            style: context.fonts.titleLarge!.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            visitedChapters[index].arabicName,
                            style: context.fonts.titleLarge!.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "${visitedChapters[index].verses} Verses",
                            style: context.fonts.titleMedium!.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Image.asset(AppLogos.quranSura, fit: BoxFit.cover),
                    ),
                  ],
                ),
              );
            },
            itemCount: visitedChapters.length,
          ),
        ),
      ],
    );
  }
}
