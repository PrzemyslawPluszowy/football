import 'package:dio/dio.dart';
import 'package:football/features/home/data/models/posts/post_model.dart';
import 'package:retrofit/retrofit.dart';

part 'post_datasource.g.dart';

@RestApi()
abstract class PostDatasource {
  factory PostDatasource(Dio dio, {String baseUrl}) = _PostDatasource;

//paginated response
  @GET('/posts')
  Future<HttpResponse<List<PostModel>>> getPosts(
    @Query('page') int page,
    @Query('per_page') int perPage,
  );

  @GET('/post/{id}')
  Future<HttpResponse<PostModel>> getPost(@Path('id') int id);
}
