import 'package:flutter/material.dart';
import 'package:football/core/extensions/context_text_theme.dart';
import 'package:football/core/failures/failure.dart';
import 'package:football/core/gen/assets.gen.dart';
import 'package:football/core/theme/app_sizes.dart';
import 'package:lottie/lottie.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    required this.message,
    this.height = 200,
    super.key,
  });

  final Failure message;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          gapH4,
          SizedBox(
            height: height,
            child: Lottie.asset(Assets.lottie.errCat.path),
          ),
          Container(
            padding: const EdgeInsets.all(Sizes.p4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.p4),
              border: Border.all(color: Colors.red),
            ),
            child: Text(
              FailureTranslate.mapFailureToMessage(message, context),
              style: context.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
