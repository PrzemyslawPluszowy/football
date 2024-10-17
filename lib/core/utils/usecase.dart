// ignore_for_file: one_member_abstracts

import 'package:football/core/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class UseCase<Data, Param> {
  Future<Either<Failure, Data>> call(Param param);
}

abstract class UseCaseNoParam<Data> {
  Future<Either<Failure, Data>> call();
}
