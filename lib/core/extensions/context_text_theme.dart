import 'package:flutter/material.dart';

extension TextThemeExt on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
