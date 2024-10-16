import 'package:football/core/failures/failure.dart';
import 'package:football/core/utils/usecase.dart';
import 'package:football/features/home/domain/entities/game_entity.dart';
import 'package:football/features/home/domain/repositories/game_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetGamesUsecase implements UseCase<List<Game>, PaginatedParam> {
  GetGamesUsecase(this.repository);
  final GameRepository repository;

  @override
  Future<Either<Failure, List<Game>>> call(PaginatedParam params) {
    return repository.getGames(params.page, params.limit);
  }
}

class PaginatedParam {
  const PaginatedParam({required this.page, required this.limit});

  final int page;
  final int limit;
}
