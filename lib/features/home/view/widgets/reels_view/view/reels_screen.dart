import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:football/features/home/domain/entities/reeel_entity.dart';
import 'package:football/features/home/view/widgets/reels_view/view/widgets/reel_player.dart';

@RoutePage()
class ReelsScreen extends StatefulWidget {
  const ReelsScreen({required this.reels, required this.selectedId, super.key});

  final List<Reel> reels;
  final int selectedId;

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController(
      initialPage: widget.selectedId,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: PageView.builder(
        controller: pageController,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: widget.reels.length,
        itemBuilder: (context, index) {
          return Hero(
            tag: widget.reels[index].id,
            child: ReelPlayer(
              reel: widget.reels[index],
              pageController: pageController,
            ),
          );
        },
      ),
    );
  }
}
