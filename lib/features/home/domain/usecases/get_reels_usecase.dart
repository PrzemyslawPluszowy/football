import 'package:football/core/failures/failure.dart';
import 'package:football/core/utils/usecase.dart';
import 'package:football/features/home/domain/entities/reeel_entity.dart';
import 'package:football/features/home/domain/repositories/reel_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetReelsUseCase implements UseCaseNoParam<List<Reel>> {
  const GetReelsUseCase({required this.repository});

  final ReelRepository repository;

  @override
  Future<Either<Failure, List<Reel>>> call() {
    return repository.getReels();
  }
}
