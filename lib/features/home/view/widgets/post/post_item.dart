import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:football/common/widgets/cashed_image.dart';
import 'package:football/core/theme/app_sizes.dart';
import 'package:football/core/theme/custom_colors.dart';
import 'package:football/features/home/view/widgets/post/content_container.dart';
import 'package:football/features/home/view/widgets/post/share_container.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    required this.imageHeight,
    required this.imageWidth,
    required this.createdAt,
    required this.description,
    required this.title,
    required this.imageUrl,
    this.videoUrl,
    this.margin = EdgeInsets.zero,
    super.key,
  });
  final int imageHeight;
  final int imageWidth;
  final DateTime createdAt;
  final String description;
  final String title;
  final String imageUrl;
  final String? videoUrl;
  final EdgeInsets margin;

  double _heightOfContainer(int imageHeight, int imageWidth) {
    return imageHeight >= imageWidth ? 500 : 300;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: _heightOfContainer(imageHeight, imageWidth),
      decoration: const BoxDecoration(),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                _image(),
                _fadeGradient(context),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ContentContainer(
                    videoUrl: videoUrl,
                    title: title,
                    description: description,
                  ),
                ),
              ],
            ),
          ),
          ShareContainer(createdAt: createdAt),
        ],
      ),
    )
        .animate()
        .flipV(
          duration: Durations.long4,
        )
        .fadeIn(
          duration: Durations.long2,
        );
  }

  Container _fadeGradient(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.0, 0.4, 0.5, 1.0],
          colors: [
            Colors.transparent,
            Colors.transparent,
            Colors.transparent,
            context.customColors!.black!,
          ],
        ),
      ),
    );
  }

  CashedImage _image() {
    return CashedImage(
      width: imageWidth,
      height: imageHeight,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(Sizes.p12),
        topRight: Radius.circular(Sizes.p12),
      ),
      imageUrl: imageUrl,
    );
  }
}
