import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:football/core/navigation/route.dart';
import 'package:football/core/theme/app_sizes.dart';
import 'package:football/features/home/view/widgets/reel/reel_item.dart';

class ReelsList extends StatelessWidget {
  const ReelsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: Sizes.p12),
        separatorBuilder: (context, index) => gapW12,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final isLoading = ValueNotifier<double>(0);
          return InkWell(
            onTap: () {
              isLoading.value == 0 ? isLoading.value = 1 : isLoading.value = 0;
              Future.delayed(Durations.extralong1, () {
                isLoading.value = 0;
                if (context.mounted) {
                  context.pushRoute(
                    ReelsRoute(
                      reels: List.generate(5, (index) => 'Reel ${index + 1}'),
                      selectedId: index,
                    ),
                  );
                }
              });
            },
            child: ReelItem(
              isLoading: isLoading,
              title: 'Title dsadasdsad',
              imageUrl:
                  'https://th.bing.com/th/id/OIP.iAYq2Dl4A-uCdKLD4Ql1owHaFX?pid=ImgDet&w=185&h=134&c=7&dpr=2',
              description: 'Description sdqdqedqwdqw qwdqwdqwdqw ',
            ),
          );
        },
      ),
    );
  }
}
