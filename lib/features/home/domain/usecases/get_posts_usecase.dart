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
    //To-do odkomentowac jak bedzie backend
    // return repository.getPosts(paginatedParam.page, paginatedParam.limit);
    return Right([
      Post(
        id: 1,
        title: 'title',
        description: 'description',
        createdAt: DateTime.now(),
        imageUrls: const PostImages(
          small: ImageInfo(url: '', width: 100, height: 100),
          medium: ImageInfo(url: '', width: 100, height: 100),
          large: ImageInfo(url: '', width: 100, height: 100),
        ),
      ),
      Post(
        id: 2,
        title: 'title',
        description: 'description',
        createdAt: DateTime.now(),
        imageUrls: const PostImages(
          small: ImageInfo(url: '', width: 100, height: 100),
          medium: ImageInfo(url: '', width: 100, height: 100),
          large: ImageInfo(url: '', width: 100, height: 100),
        ),
      ),
    ]);
  }
}

class PaginatedParam {
  PaginatedParam({required this.page, required this.limit});

  final int page;
  final int limit;
}
