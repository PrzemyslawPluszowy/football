import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:football/core/navigation/route.dart';
import 'package:football/core/theme/app_sizes.dart';
import 'package:football/features/home/domain/entities/reeel_entity.dart';
import 'package:football/features/home/view/widgets/reel/reel_item.dart';

class ListStoriesWidget extends StatelessWidget {
  const ListStoriesWidget({
    required this.reels,
    super.key,
  });
  final List<Reel> reels;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(left: Sizes.p12),
      separatorBuilder: (context, index) => gapW12,
      itemCount: reels.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final reel = reels[index];
        final isLoading = ValueNotifier<double>(0);
        return InkWell(
          onTap: () {
            isLoading.value == 0 ? isLoading.value = 1 : isLoading.value = 0;
            Future.delayed(Durations.extralong1, () {
              isLoading.value = 0;
              if (context.mounted) {
                context.pushRoute(
                  ReelsRoute(
                    reels: reels,
                    selectedId: index,
                  ),
                );
              }
            });
          },
          child: ReelItem(
            isLoading: isLoading,
            title: reel.title,
            imageUrl: reel.imageUrls?.medium.url ?? '',
            description: reel.description ?? '',
          ),
        );
      },
    );
  }
}
