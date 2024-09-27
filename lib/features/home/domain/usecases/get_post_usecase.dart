import 'package:football/core/failures/failure.dart';
import 'package:football/core/utils/usecase.dart';
import 'package:football/features/home/domain/entities/post_entity.dart';
import 'package:football/features/home/domain/repositories/post_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetPostUseCase implements UseCase<Post, int> {
  const GetPostUseCase({required this.repository});

  final PostRepository repository;

  Future<Either<Failure, Post>> call(int id) async {
    return repository.getPost(id);
  }
}
