import 'package:flutter/material.dart';

extension ColorExt on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
