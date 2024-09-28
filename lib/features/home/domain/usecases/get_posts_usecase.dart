import 'package:football/core/failures/failure.dart';
import 'package:football/core/utils/usecase.dart';
import 'package:football/features/home/domain/entities/post_entity.dart';
import 'package:football/features/home/domain/repositories/post_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetPostsUseCase implements UseCase<List<Post>, PaginatedParam> {
  const GetPostsUseCase({required this.repository});

  final PostRepository repository;

  @override
  Future<Either<Failure, List<Post>>> call(
    PaginatedParam paginatedParam,
  ) async {
    return repository.getPosts(paginatedParam.page, paginatedParam.limit);
  }
}

class PaginatedParam {
  PaginatedParam({required this.page, required this.limit});

  final int page;
  final int limit;
}
