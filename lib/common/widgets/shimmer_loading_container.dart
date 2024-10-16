import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:football/core/extensions/string_hc.dart';
import 'package:football/core/theme/app_sizes.dart';
import 'package:football/core/theme/custom_colors.dart';

class ShimmerLoadingContainer extends StatelessWidget {
  const ShimmerLoadingContainer({
    super.key,
    this.height = 150,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.customColors?.lightGrey ?? Colors.grey,
            Colors.transparent,
          ],
        ),
        borderRadius: BorderRadius.circular(Sizes.p12),
      ),
      margin: const EdgeInsets.symmetric(horizontal: Sizes.p12),
      height: height,
      child: Center(
        child: Text('Loading'.hardcoded),
      ),
    )
        .animate()
        .fadeIn(
          duration: Durations.extralong4,
        )
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .shimmer(
      duration: const Duration(
        milliseconds: 3000,
      ),
      colors: [
        context.customColors?.lightGrey ?? Colors.grey,
        context.customColors?.black ?? Colors.black,
      ],
    );
  }
}
