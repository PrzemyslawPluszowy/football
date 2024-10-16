import 'dart:math';

import 'package:flutter/material.dart';
import 'package:football/common/widgets/cashed_image.dart';
import 'package:football/core/theme/app_sizes.dart';
import 'package:football/core/theme/custom_colors.dart';
import 'package:football/features/home/view/widgets/reel/reel_content.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ReelItem extends StatefulWidget {
  const ReelItem({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.isLoading,
    super.key,
  });

  final String title;
  final String imageUrl;
  final String description;
  final ValueNotifier<double> isLoading;
  static const int height = 220;
  static const int width = 160;
  static const double borderWidth = 2;
  static const double borderPadding = 2;

  @override
  State<ReelItem> createState() => _ReelItemState();
}

class _ReelItemState extends State<ReelItem> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> curve;
  late VoidCallback isLoadingListener;

  @override
  void initState() {
    super.initState();
    initAnimation();
    addIsLoadingListener();
  }

  void initAnimation() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    curve = Tween<double>(begin: 0, end: 2 * pi).animate(controller);
  }

  void addIsLoadingListener() {
    isLoadingListener = () {
      if (widget.isLoading.value == 0) {
        controller.stop();
      } else {
        controller.repeat(reverse: true);
      }
    };
    widget.isLoading.addListener(isLoadingListener);
  }

  @override
  void dispose() {
    controller.dispose();
    widget.isLoading.removeListener(isLoadingListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return ValueListenableBuilder(
          valueListenable: widget.isLoading,
          builder: (context, double value, child) {
            return Container(
              padding: const EdgeInsets.all(ReelItem.borderPadding),
              width: ReelItem.width.toDouble(),
              decoration: _buildDecoration(context, value),
              child: _buildReelContent(context, value),
            );
          },
        );
      },
    );
  }

  BoxDecoration _buildDecoration(BuildContext context, double value) {
    if (value == 0) {
      return BoxDecoration(
        color: context.customColors?.container,
        borderRadius: BorderRadius.circular(Sizes.p12),
        border: Border.all(
          color: context.customColors?.primary ?? Colors.transparent,
          width: ReelItem.borderWidth,
        ),
      );
    } else {
      return _animatedGradientDecoration(context);
    }
  }

  BoxDecoration _animatedGradientDecoration(BuildContext context) {
    return BoxDecoration(
      gradient: LinearGradient(
        transform: GradientRotation(curve.value),
        stops: const [0.0, 0.1, 1.0],
        colors: [
          Colors.green,
          context.customColors?.background ?? Colors.transparent,
          context.customColors?.background ?? Colors.transparent,
        ],
      ),
      borderRadius: BorderRadius.circular(Sizes.p8),
      backgroundBlendMode: BlendMode.srcOver,
      border: Border.all(
        width: ReelItem.borderWidth,
        color: Colors.green,
      ),
    );
  }

  Widget _buildReelContent(BuildContext context, double value) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.p8),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildImage(),
          if (value == 1) _buildLoadingIndicator(),
          _buildReelInfo(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return CashedImage(
      width: ReelItem.width,
      height: ReelItem.height,
      imageUrl: widget.imageUrl,
      borderRadius: BorderRadius.circular(Sizes.p8),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Positioned.fill(
      child: Center(
        child: SizedBox(
          width: Sizes.p64,
          height: Sizes.p64,
          child: LoadingIndicator(
            indicatorType: Indicator.ballSpinFadeLoader,
            colors: [Colors.white],
            strokeWidth: 2,
            backgroundColor: Colors.transparent,
            pathBackgroundColor: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildReelInfo() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: ReelContent(
        title: widget.title,
        description: widget.description,
      ),
    );
  }
}
