import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  ColorScheme get appColors => Theme.of(this).colorScheme;

  TextTheme get fonts => Theme.of(this).textTheme;
}
