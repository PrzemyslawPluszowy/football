import 'package:flutter/material.dart';
import 'package:football/core/gen/assets.gen.dart';
import 'package:football/core/theme/app_sizes.dart';
import 'package:ionicons/ionicons.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Ionicons.people_outline),
            iconSize: Sizes.p24,
            onPressed: () {},
          ),
          Image.asset(Assets.herbBw.path, height: Sizes.p48),
          IconButton(
            icon: const Icon(Ionicons.settings_outline),
            iconSize: Sizes.p24,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
