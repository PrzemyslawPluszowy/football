import 'package:football/core/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class UseCase<Data, Param> {
  Future<Either<Failure, Data>> call(Param param);
}

class NoParams {}
