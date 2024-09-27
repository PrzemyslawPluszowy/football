import 'package:football/core/failures/failure.dart';
import 'package:football/features/home/domain/entities/post_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class PostRepository {
  Future<Either<Failure, List<Post>>> getPosts(int page, int limit);
  Future<Either<Failure, Post>> getPost(int id);
}
