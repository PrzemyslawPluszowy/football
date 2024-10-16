// ignore_for_file: one_member_abstracts
import 'package:dio/dio.dart';
import 'package:football/features/home/data/models/game/game_model.dart';
import 'package:retrofit/retrofit.dart';

part 'game_datasource.g.dart';

@RestApi()
abstract class GameDatasource {
  factory GameDatasource(Dio dio, {String baseUrl}) = _GameDatasource;

  @GET('/games')
  Future<HttpResponse<List<GameModel>>> getGames(
    @Query('page') int page,
    @Query('per_page') int perPage,
  );
}




// [
//   {
//     "id": 0,
//     "date": "2024-09-14T17:15:07.000000Z",
//     "score": "1:0",
//     "home_club": {
//       "id": 0,
//       "name": "LKS Pisarowce",
//       "stadium": "233, 38-530 Pisarowce"
//     },
//     "away_club": {
//       "id": 0,
//       "name": "LKS Pisarowce",
//       "stadium": "233, 38-530 Pisarowce"
//     },
//     "created_at": "2024-09-14T17:15:07.000000Z"
//   }
// ]
