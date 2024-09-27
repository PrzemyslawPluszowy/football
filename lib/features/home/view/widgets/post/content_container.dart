import 'package:flutter/material.dart';
import 'package:football/core/extensions/context_text_theme.dart';
import 'package:football/core/theme/app_sizes.dart';
import 'package:football/core/theme/custom_colors.dart';
import 'package:ionicons/ionicons.dart';

class ContentContainer extends StatelessWidget {
  const ContentContainer({
    required this.videoUrl,
    required this.title,
    required this.description,
    super.key,
  });

  final String? videoUrl;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.p8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (videoUrl != null)
            Icon(
              Ionicons.logo_youtube,
              color: context.customColors?.primary?.withOpacity(0.5),
              size: Sizes.p48,
            ),
          gapH4,
          Container(
            color: context.customColors?.primary,
            width: Sizes.p48,
            height: 3,
          ),
          gapH4,
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.titleMedium?.copyWith(
              color: Colors.white,
            ),
          ),
          gapH4,
          Text(
            description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodySmall?.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
