import 'package:flutter/material.dart';
import 'package:football/core/theme/app_sizes.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmerReels extends StatelessWidget {
  const LoadingShimmerReels({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: Sizes.p12),
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          margin: const EdgeInsets.only(right: Sizes.p12),
          width: 160,
          height: 240,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
