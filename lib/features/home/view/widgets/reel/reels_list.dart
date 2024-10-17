import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/common/widgets/custom_error_widget.dart';
import 'package:football/features/home/view/widgets/reel/cubit/reels_cubit.dart';
import 'package:football/features/home/view/widgets/reel/list_stories_widget.dart';
import 'package:football/features/home/view/widgets/reel/loading_shimmer_reels.dart';
import 'package:football/features/home/view/widgets/reel/no_stories_widget.dart';

class ReelsList extends StatelessWidget {
  const ReelsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: BlocBuilder<ReelsCubit, ReelsState>(
        builder: (context, state) {
          return state.when(
            loading: LoadingShimmerReels.new,
            error: (failure) =>
                CustomErrorWidget(message: failure).animate().fadeIn(
                      duration: Durations.long1,
                    ),
            loaded: (reels) {
              if (reels.isEmpty) {
                return const NoStoriesWidget().animate().fadeIn(
                      duration: Durations.long1,
                    );
              } else {
                return ListStoriesWidget(reels: reels).animate().fadeIn(
                      duration: Durations.long1,
                    );
              }
            },
          );
        },
      ),
    );
  }
}
