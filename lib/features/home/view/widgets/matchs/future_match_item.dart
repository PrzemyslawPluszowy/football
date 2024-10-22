import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:football/core/extensions/context_text_theme.dart';
import 'package:football/core/theme/app_sizes.dart';
import 'package:football/core/theme/custom_colors.dart';
import 'package:intl/intl.dart';

class FutureMatchItem extends StatelessWidget {
  const FutureMatchItem({
    required this.firstFootballTeam,
    required this.secondFootballTeam,
    required this.matchTime,
    required this.stadium,
    this.result,
    super.key,
  });

  final String firstFootballTeam;
  final String secondFootballTeam;
  final String? result;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Sizes.p8,
            height: 160,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gapH4,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 140 - Sizes.p8 / 2 - Sizes.p12,
                    child: Text(
                      firstFootballTeam,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: context.customColors?.text,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                    child: Text(
                      textAlign: TextAlign.center,
                      'vs',
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: context.customColors?.text,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 140 - Sizes.p8 / 2 - Sizes.p12,
                    child: Text(
                      textAlign: TextAlign.end,
                      secondFootballTeam,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: context.customColors?.text,
                      ),
                    ),
                  ),
                  gapW12,
                ],
              ),
              if (result != null) ...[
                SizedBox(
                  width: 300 - Sizes.p8 - Sizes.p12 * 2,
                  child: Text(
                    textAlign: TextAlign.center,
                    result!,
                    style: context.textTheme.headlineSmall?.copyWith(
                      color: context.customColors?.text,
                    ),
                  ),
                ),
              ],
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
              gapH8,
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
