import 'package:flutter/material.dart';

import '../../AppDesigns/AppLogos/AppLogos.dart';

class CostumeScaffoldBackground extends StatelessWidget {
  Widget child;
  String backGroundImagePath;

  CostumeScaffoldBackground({
    required this.child,
    this.backGroundImagePath = AppLogos.backGround,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backGroundImagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
