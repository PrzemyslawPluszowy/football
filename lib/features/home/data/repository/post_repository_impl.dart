import 'package:football/core/failures/failure.dart';
import 'package:football/core/utils/api_response_validator.dart';
import 'package:football/features/home/data/datasource/api/post_datasource.dart';
import 'package:football/features/home/domain/entities/post_entity.dart';
import 'package:football/features/home/domain/repositories/post_repository.dart';
import 'package:fpdart/fpdart.dart';

class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl({required this.datasource});
  final PostDatasource datasource;

  @override
  Future<Either<Failure, Post>> getPost(int id) async {
    return ApiResponseValidator.defaultValidateApiResponse(
      apiCallFunc: () => datasource.getPost(id),
      entityMapper: (data) => data.toEntity(),
    );
  }

  @override
  Future<Either<Failure, List<Post>>> getPosts(int page, int limit) async {
    return ApiResponseValidator.defaultValidateApiResponse(
      apiCallFunc: () => datasource.getPosts(page, limit),
      entityMapper: (data) => data.map((e) => e.toEntity()).toList(),
    );
  }
}
