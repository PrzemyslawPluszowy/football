import 'package:football/core/failures/failure.dart';
import 'package:football/core/utils/api_response_validator.dart';
import 'package:football/features/home/data/datasource/api/reel_datasource.dart';
import 'package:football/features/home/domain/entities/reeel_entity.dart';
import 'package:football/features/home/domain/repositories/reel_repository.dart';
import 'package:fpdart/fpdart.dart';

class ReelRepositoryImpl implements ReelRepository {
  ReelRepositoryImpl({required this.datasource});
  final ReelDataSource datasource;
  @override
  Future<Either<Failure, List<Reel>>> getReels() async {
    return ApiResponseValidator.defaultValidateApiResponse(
      apiCallFunc: datasource.getReels,
      entityMapper: (data) => data.map((e) => e.toEntity()).toList(),
    );
  }
}
