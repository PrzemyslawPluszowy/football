import 'package:football/core/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

// ignore: one_member_abstracts
abstract class UseCase<Data, Param> {
  Future<Either<Failure, Data>> call(Param param);
}

class NoParams {}
