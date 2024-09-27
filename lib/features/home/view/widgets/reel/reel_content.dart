import 'package:flutter/material.dart';
import 'package:football/core/extensions/context_text_theme.dart';
import 'package:football/core/theme/app_sizes.dart';
import 'package:football/core/theme/custom_colors.dart';

class ReelContent extends StatelessWidget {
  const ReelContent({
    required this.title,
    required this.description,
    super.key,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.p8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.0, 0.5],
          colors: [
            Colors.transparent,
            context.customColors!.black!,
          ],
        ),
        borderRadius: BorderRadius.circular(Sizes.p8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            title,
            style: context.textTheme.titleMedium?.copyWith(
              color: Colors.white,
            ),
          ),
          gapH4,
          Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            description,
            style: context.textTheme.bodySmall?.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
