import 'package:football/core/failures/failure.dart';
import 'package:football/features/home/domain/entities/reeel_entity.dart';
import 'package:fpdart/fpdart.dart';

// ignore: one_member_abstracts
abstract class ReelRepository {
  Future<Either<Failure, List<Reel>>> getReels();
}
