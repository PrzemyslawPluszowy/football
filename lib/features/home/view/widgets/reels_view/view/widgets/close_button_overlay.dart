import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:football/core/theme/app_sizes.dart';
import 'package:ionicons/ionicons.dart';

class CloseButtonOverlay extends StatelessWidget {
  const CloseButtonOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      left: 20,
      child: IconButton(
        icon: const Icon(
          Ionicons.close_circle,
          size: Sizes.p32,
          color: Colors.white,
        ),
        onPressed: () {
          context.maybePop();
        },
      ).animate().moveX(
            begin: -300,
            end: 0,
            duration: const Duration(seconds: 1),
          ),
    );
  }
}
