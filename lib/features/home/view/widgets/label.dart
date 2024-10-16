import 'package:flutter/material.dart';
import 'package:football/core/extensions/context_text_theme.dart';
import 'package:football/core/extensions/string_hc.dart';
import 'package:football/core/theme/app_sizes.dart';
import 'package:football/core/theme/custom_colors.dart';

class Label extends StatelessWidget {
  const Label({
    required this.text,
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p12, vertical: Sizes.p8),
      child: Text(
        text.hardcoded,
        style: context.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: context.customColors?.text,
        ),
      ),
    );
  }
}
