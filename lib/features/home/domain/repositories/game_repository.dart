// ignore_for_file: one_member_abstracts

import 'package:football/core/failures/failure.dart';
import 'package:football/features/home/domain/entities/game_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class GameRepository {
  Future<Either<Failure, List<Game>>> getGames(int page, int perPage);
}
