import 'package:flutter/material.dart';
import 'package:football/core/extensions/context_text_theme.dart';
import 'package:football/core/theme/app_sizes.dart';
import 'package:football/core/theme/custom_colors.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

class ShareContainer extends StatelessWidget {
  const ShareContainer({
    required this.createdAt,
    super.key,
  });

  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.customColors!.black,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(Sizes.p12),
          bottomRight: Radius.circular(Sizes.p12),
        ),
      ),
      height: Sizes.p56,
      padding: const EdgeInsets.all(Sizes.p8),
      child: Row(
        children: [
          gapW12,
          Expanded(
            child: Text(
              DateFormat('dd/MM/yyyy').format(createdAt),
              style: context.textTheme.bodySmall?.copyWith(
                color: context.customColors!.white,
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Ionicons.share_social_outline,
              color: context.customColors?.white,
            ),
            iconSize: Sizes.p24,
          ),
          gapW12,
        ],
      ),
    );
  }
}
