import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/common/widgets/custom_error_widget.dart';
import 'package:football/common/widgets/shimmer_loading_container.dart';
import 'package:football/core/theme/app_sizes.dart';
import 'package:football/features/home/view/widgets/matchs/cubit/games_cubit.dart';
import 'package:football/features/home/view/widgets/matchs/future_match_item.dart';
import 'package:football/features/home/view/widgets/matchs/no_games_widget.dart';

class MatchesList extends StatelessWidget {
  const MatchesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: BlocBuilder<GamesCubit, GamesState>(
        builder: (context, state) {
          return state.when(
            initial: ShimmerLoadingContainer.new,
            loading: ShimmerLoadingContainer.new,
            error: (message) => CustomErrorWidget(message: message, height: 90),
            loaded: (games) {
              if (games.isEmpty) {
                return const NoGamesWidget().animate().fadeIn(duration: Durations.extralong1);
              }
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
                scrollDirection: Axis.horizontal,
                itemCount: games.length,
                separatorBuilder: (context, index) => gapW12,
                itemBuilder: (context, index) {
                  final game = games[index];
                  return FutureMatchItem(
                    firstFootballTeam: game.homeClub.name,
                    secondFootballTeam: game.awayClub.name,
                    matchTime: game.date,
                    stadium: game.homeClub.stadium,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
