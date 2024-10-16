import 'package:football/core/failures/failure.dart';
import 'package:football/features/home/data/models/game/game_model.dart';
import 'package:football/features/home/domain/entities/game_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class GameRepository {
  Future<Either<Failure, List<GameModel>>> getGames();
  Future<Either<Failure, Game>> getGame(int id);
}
