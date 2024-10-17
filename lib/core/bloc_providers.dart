import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/core/di/di.dart';
import 'package:football/features/home/view/widgets/matchs/cubit/games_cubit.dart';
import 'package:football/features/home/view/widgets/post/cubit/post_list_cubit.dart';
import 'package:football/features/home/view/widgets/reel/cubit/reels_cubit.dart';

class BlocProviders {
  static List<BlocProvider> providers = [
    BlocProvider<PostListCubit>(
      create: (context) => getIt<PostListCubit>()..getPosts(),
    ),
    BlocProvider<GamesCubit>(
      create: (context) => getIt<GamesCubit>()..getGames(),
    ),
    BlocProvider<ReelsCubit>(
      create: (context) => getIt<ReelsCubit>()..getReels(),
    ),
  ];
}
