import 'package:flutter/material.dart';
import 'package:islami/AppDesigns/AppLogos/AppLogos.dart';
import 'package:islami/extentions/context_extentions.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  double angle = 5;

  int counter = 0;
  int zkrIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Text(
          "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
          style: context.fonts.titleLarge!.copyWith(fontSize: 36),
        ),
        const SizedBox(height: 20),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              AppLogos.sebha_head,
              width: screenSize.width * 2.6,
              height: 100,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 94),
              child: GestureDetector(
                onTap: sebhaOnTab,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.rotate(
                      angle: angle,
                      child: Image.asset(
                        AppLogos.sebha_body,
                        width: screenSize.width * 3.79,
                        height: 381,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          azkar[zkrIndex],
                          style: context.fonts.titleLarge!.copyWith(
                            fontSize: 36,
                          ),
                        ),
                        Text(
                          "$counter",
                          style: context.fonts.titleLarge!.copyWith(
                            fontSize: 36,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void sebhaOnTab() {
    angle += 8;
    if (counter == 33) {
      zkrIndex < azkar.length - 1 ? zkrIndex++ : zkrIndex = 0;
      counter = 0;
    }
    counter++;
    setState(() {});
  }
}

List<String> azkar = ["سبحان الله", "الحمدلله", "لا إله إلا الله", "الله اكبر"];
