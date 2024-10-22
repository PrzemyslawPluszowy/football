import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:football/core/extensions/context_text_theme.dart';
import 'package:football/core/theme/app_sizes.dart';
import 'package:football/features/home/domain/entities/reeel_entity.dart';

class ReelDescription extends StatelessWidget {
  const ReelDescription({required this.reel, super.key});

  final Reel reel;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100,
      left: 0,
      child: Container(
        padding: const EdgeInsets.all(Sizes.p4),
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(0.5),
              Colors.black.withOpacity(0),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              reel.title,
              style: context.textTheme.headlineMedium?.copyWith(
                color: Colors.white,
              ),
            ),
            Container(
              width: 70,
              height: 2,
              color: Colors.white,
            ),
            if (reel.description != null && reel.description!.isNotEmpty)
              Text(
                reel.description!,
                style: context.textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                ),
              ),
          ],
        ).animate().moveX(
              begin: -300,
              end: 0,
              duration: const Duration(seconds: 1),
            ),
      ),
    );
  }
}
