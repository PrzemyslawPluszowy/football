import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:football/features/home/domain/entities/reeel_entity.dart';

@RoutePage()
class ReelsScreen extends StatelessWidget {
  ReelsScreen({required this.reels, required this.selectedId, super.key});

  final List<Reel> reels;
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
            reels[index].title,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
