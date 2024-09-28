import 'package:dio/dio.dart';
import 'package:football/features/home/data/models/post_model.dart';
import 'package:retrofit/retrofit.dart';

part 'post_datasource.g.dart';

@RestApi()
abstract class PostDatasource {
  factory PostDatasource(Dio dio, {String baseUrl}) = _PostDatasource;

//paginated response
  @GET('/posts ')
  Future<HttpResponse<List<PostModel>>> getPosts(
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @GET('/posts/{id}')
  Future<HttpResponse<PostModel>> getPost(@Path('id') int id);
}
