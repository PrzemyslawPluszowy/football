import 'package:dio/dio.dart';
import 'package:football/features/home/data/datasource/api/post_datasource.dart';
import 'package:football/features/home/data/repository/post_repository_impl.dart';
import 'package:football/features/home/domain/repositories/post_repository.dart';
import 'package:football/features/home/domain/usecases/get_posts_usecase.dart';
import 'package:football/features/home/view/widgets/post/cubit/post_list_cubit.dart';
import 'package:football/main_development.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://217.182.75.14/api',
    ),
  );
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printResponseHeaders: true,
      ),
    ),
  );
  getIt.registerLazySingleton<Dio>(() => dio);
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
