import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:football/core/extensions/context_text_theme.dart';
import 'package:football/core/extensions/string_hc.dart';
import 'package:football/core/theme/app_sizes.dart';
import 'package:football/core/theme/custom_colors.dart';
import 'package:intl/intl.dart';

class FutureMatchItem extends StatelessWidget {
  const FutureMatchItem({
    required this.firstFootballTeam,
    required this.secondFootballTeam,
    required this.matchTime,
    required this.stadium,
    super.key,
  });

  final String firstFootballTeam;
  final String secondFootballTeam;
  final DateTime matchTime;
  final String stadium;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: context.customColors?.container,
        borderRadius: BorderRadius.circular(Sizes.p12),
      ),
      child: Row(
        children: [
          Container(
            width: Sizes.p8,
            height: 150,
            decoration: BoxDecoration(
              color: context.customColors!.primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(Sizes.p12),
                bottomLeft: Radius.circular(Sizes.p12),
              ),
            ),
          ),
          gapW12,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$firstFootballTeam vs $secondFootballTeam'.hardcoded,
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.customColors?.text,
                ),
              ),
              gapH4,
              Text(
                stadium,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.customColors?.text,
                ),
              ),
              gapH4,
              Text(
                DateFormat('dd/MM/yyyy - HH:mm').format(matchTime),
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.customColors?.text,
                ),
              ),
            ],
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(
          duration: Durations.extralong4,
        )
        .flipH(
          duration: Durations.extralong4,
        );
  }
}
