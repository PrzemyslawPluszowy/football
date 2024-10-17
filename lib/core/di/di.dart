import 'package:dio/dio.dart';
import 'package:football/features/home/data/datasource/api/game_datasource.dart';
import 'package:football/features/home/data/datasource/api/post_datasource.dart';
import 'package:football/features/home/data/datasource/api/reel_datasource.dart';
import 'package:football/features/home/data/repository/games_repository_impl.dart';
import 'package:football/features/home/data/repository/post_repository_impl.dart';
import 'package:football/features/home/data/repository/reel_repository_impl.dart';
import 'package:football/features/home/domain/repositories/game_repository.dart';
import 'package:football/features/home/domain/repositories/post_repository.dart';
import 'package:football/features/home/domain/repositories/reel_repository.dart';
import 'package:football/features/home/domain/usecases/get_games_usecase.dart';
import 'package:football/features/home/domain/usecases/get_posts_usecase.dart';
import 'package:football/features/home/domain/usecases/get_reels_usecase.dart';
import 'package:football/features/home/view/widgets/matchs/cubit/games_cubit.dart';
import 'package:football/features/home/view/widgets/post/cubit/post_list_cubit.dart';
import 'package:football/features/home/view/widgets/reel/cubit/reels_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://217.182.75.14/api',
    ),
  );
  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ),
  );
  getIt.registerLazySingleton<Dio>(() => dio);
  _post();
  _games();
  _reels();
}

void _reels() {
  getIt
    ..registerLazySingleton(() => ReelDataSource(getIt.call()))
    ..registerLazySingleton<ReelRepository>(
      () => ReelRepositoryImpl(datasource: getIt.call()),
    )
    ..registerLazySingleton(() => GetReelsUseCase(repository: getIt.call()))
    ..registerLazySingleton(() => ReelsCubit(getReelsUseCase: getIt.call()));
}

void _games() {
  getIt
    ..registerLazySingleton(() => GameDatasource(getIt.call()))
    ..registerLazySingleton<GameRepository>(
      () => GamesRepositoryImpl(datasource: getIt.call()),
    )
    ..registerLazySingleton(() => GetGamesUsecase(getIt.call()))
    ..registerLazySingleton(
      () => GamesCubit(getGamesUsecase: getIt.call()),
    );
}

void _post() {
  getIt
    ..registerLazySingleton(() => PostDatasource(getIt.call()))
    ..registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(datasource: getIt.call()),
    )
    ..registerLazySingleton(() => GetPostsUseCase(repository: getIt.call()))
    ..registerLazySingleton(() => PostListCubit(getPostsUseCase: getIt.call()));
}
