import 'package:football/core/failures/failure.dart';
import 'package:football/main_development.dart';
import 'package:fpdart/fpdart.dart';
import 'package:retrofit/retrofit.dart';

/// Klasa pomocnicza do walidacji odpowiedzi API.
class ApiResponseValidator {
  /// Waliduje odpowiedź API i mapuje dane na encje.
  ///
  /// Zwraca [Either<Failure, E>] w zależności od wyniku operacji.
  ///
  /// [apiCallFunc] to asynchroniczna funkcja wykonująca zapytanie API,
  /// zwracająca obiekt [HttpResponse<M>]. Z  pakietu Retrofit
  ///
  /// [entityMapper] to funkcja konwertująca dane typu [M] na encje typu [E].
  ///
  /// W przypadku błędów zwraca instancję [Failure] (np. [NotFoundFailure], [ServerFailure]).
  ///
  /// Przykład użycia:
  /// ```dart
  /// final result = await ApiResponseValidator.defaultValidateApiResponse<List<PostModel>, List<Post>>(
  ///   apiCallFunc: () async => await datasource.getPosts(),
  ///   entityMapper: (data) => data.map((model) => model.toEntity()).toList(),
  /// );
  /// ```
  static Future<Either<Failure, E>> defaultValidateApiResponse<M, E>({
    required Future<HttpResponse<M>> Function() apiCallFunc,
    required E Function(M) entityMapper,
  }) async {
    try {
      final httpRes = await apiCallFunc();

      if (httpRes.response.statusCode == 200) {
        return Right(entityMapper(httpRes.data));
      } else if (httpRes.response.statusCode == 404) {
        return Left(NotFoundFailure(e: '404'));
      } else {
        return Left(ServerFailure(e: '500'));
      }
    } catch (e, s) {
      talker.error(e, s);
      return Left(UnknownFailure());
    }
  }
}
