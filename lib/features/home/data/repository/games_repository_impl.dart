import 'package:football/core/failures/failure.dart';
import 'package:football/core/utils/api_response_validator.dart';
import 'package:football/features/home/data/datasource/api/game_datasource.dart';
import 'package:football/features/home/domain/entities/game_entity.dart';
import 'package:football/features/home/domain/repositories/game_repository.dart';
import 'package:fpdart/fpdart.dart';

class GamesRepositoryImpl implements GameRepository {
  GamesRepositoryImpl({required this.datasource});
  final GameDatasource datasource;

  @override
  Future<Either<Failure, List<Game>>> getGames(
    int perPage,
    int page,
  ) async {
    return ApiResponseValidator.defaultValidateApiResponse(
      apiCallFunc: () => datasource.getGames(page, perPage),
      entityMapper: (data) => data.map((e) => e.toEntity()).toList(),
    );
  }
}
