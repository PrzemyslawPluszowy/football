import 'package:flutter/material.dart';
import 'package:football/core/extensions/string_hc.dart';
import 'package:football/core/theme/app_sizes.dart';
import 'package:football/core/theme/custom_colors.dart';

class NoGamesWidget extends StatelessWidget {
  const NoGamesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Sizes.p12),
      width: 300,
      height: 150,
      decoration: BoxDecoration(
        color: context.customColors?.container,
        borderRadius: BorderRadius.circular(Sizes.p12),
      ),
      child: Center(
        child: Text('No games found at this moment'.hardcoded),
      ),
    );
  }
}
