import 'package:flutter/material.dart';
import 'package:football/core/extensions/string_hc.dart';
import 'package:football/core/gen/assets.gen.dart';
import 'package:football/core/theme/app_sizes.dart';

class NoStoriesWidget extends StatelessWidget {
  const NoStoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Container(
        margin: const EdgeInsets.all(Sizes.p12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.p12),
          image: DecorationImage(
            image: AssetImage(Assets.soccer.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            height: 70,
            width: double.infinity,
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: Text(
                'At this time there are no stories'.hardcoded,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.p24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
