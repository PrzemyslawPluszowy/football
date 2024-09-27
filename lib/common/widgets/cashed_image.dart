import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:football/core/gen/assets.gen.dart';
import 'package:football/core/theme/custom_colors.dart';

class CashedImage extends StatelessWidget {
  const CashedImage({
    required this.width,
    required this.height,
    required this.imageUrl,
    this.borderRadius = BorderRadius.zero,
    super.key,
  });

  final int width;
  final int height;
  final String imageUrl;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: context.customColors?.lightGrey,
        ),
        width: width.toDouble(),
        height: height.toDouble(),
      ).animate(
        onPlay: (controller) {
          controller.repeat();
        },
      ).shimmer(
        duration: Durations.extralong4,
      ),
      errorWidget: (context, url, error) => Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: context.customColors?.lightGrey,
          image: DecorationImage(
            image: AssetImage(Assets.noImg.path),
            fit: BoxFit.cover,
          ),
        ),
        width: width.toDouble(),
        height: height.toDouble(),
      ),
    );
  }
}
