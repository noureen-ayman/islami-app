import 'package:flutter/material.dart';
import 'package:islami/extentions/context_extentions.dart';

import '../../../AppDesigns/AppColors.dart';
import '../../../AppDesigns/AppLogos/AppLogos.dart';
import 'Hadeth.dart';

class HadethView extends StatelessWidget {
  final Hadeth hadeth;

  const HadethView({required this.hadeth, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 12),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primary,
        image: DecorationImage(
          image: AssetImage(AppLogos.hadethDetailsBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Text(
            hadeth.tittle,
            style: context.fonts.titleLarge?.copyWith(color: Colors.black),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 45),
              child: SingleChildScrollView(
                child: Text(
                  hadeth.content,
                  style: context.fonts.titleMedium?.copyWith(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
