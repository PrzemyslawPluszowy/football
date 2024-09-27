import 'package:flutter/material.dart';
import 'package:football/core/theme/app_sizes.dart';
import 'package:football/features/home/view/widgets/matchs/future_match_item.dart';

class MatchesList extends StatelessWidget {
  const MatchesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (context, index) => gapW12,
        itemBuilder: (context, index) {
          return FutureMatchItem(
            firstFootballTeam: 'firstFootballTeam',
            secondFootballTeam: 'secondFootballTeam',
            matchTime: DateTime.now(),
            stadium: 'stadium name',
          );
        },
      ),
    );
  }
}
