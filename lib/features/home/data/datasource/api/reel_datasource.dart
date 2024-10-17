// ignore_for_file: one_member_abstracts

import 'package:dio/dio.dart';
import 'package:football/features/home/data/models/reels/reel_model.dart';
import 'package:retrofit/retrofit.dart';

part 'reel_datasource.g.dart';

@RestApi()
abstract class ReelDataSource {
  factory ReelDataSource(Dio dio, {String baseUrl}) = _ReelDataSource;
  @GET('/reels')
  Future<HttpResponse<List<ReelModel>>> getReels();
}
