import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ReelsScreen extends StatelessWidget {
  ReelsScreen({required this.reels, required this.selectedId, super.key});

  final List<String> reels;
  final int selectedId;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: PageView.builder(
        controller: pageController,
        physics: const BouncingScrollPhysics(),
        scrollBehavior: const MaterialScrollBehavior(),
        itemCount: reels.length,
        itemBuilder: (context, index) => Center(
          child: Text(
            reels[index],
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
