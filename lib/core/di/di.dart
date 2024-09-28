import 'package:dio/dio.dart';
import 'package:football/features/home/data/datasource/api/post_datasource.dart';
import 'package:football/features/home/data/repository/post_repository_impl.dart';
import 'package:football/features/home/domain/repositories/post_repository.dart';
import 'package:football/features/home/domain/usecases/get_posts_usecase.dart';
import 'package:football/features/home/view/widgets/post/cubit/post_list_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(Dio.new);
  _post();
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
