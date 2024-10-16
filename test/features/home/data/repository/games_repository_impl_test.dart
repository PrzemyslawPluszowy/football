import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:football/core/failures/failure.dart';
import 'package:football/features/home/data/datasource/api/game_datasource.dart';
import 'package:football/features/home/data/models/game/game_model.dart';
import 'package:football/features/home/data/repository/games_repository_impl.dart';
import 'package:football/features/home/domain/entities/game_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retrofit/retrofit.dart';

class MockDataSource extends Mock implements GameDatasource {}

final mockGameModelList = <GameModel>[
  GameModel(
    id: 1,
    date: DateTime(2024),
    homeClub: const ClubModel(id: 1, name: 'name1', stadium: 'stadium1'),
    awayClub: const ClubModel(id: 2, name: 'name2', stadium: 'stadium2'),
    createdAt: DateTime(2024),
  ),
  GameModel(
    id: 2,
    date: DateTime(2024),
    homeClub: const ClubModel(id: 1, name: 'name1', stadium: 'stadium1'),
    awayClub: const ClubModel(id: 2, name: 'name2', stadium: 'stadium2'),
    createdAt: DateTime(2024),
  ),
];

void main() {
  late MockDataSource mockDataSource;
  late GamesRepositoryImpl gamesRepositoryImpl;
  setUp(() {
    mockDataSource = MockDataSource();
    gamesRepositoryImpl = GamesRepositoryImpl(datasource: mockDataSource);
  });
  test('should get games from the datasource', () async {
    when(() => mockDataSource.getGames(1, 5)).thenAnswer(
      (_) async => HttpResponse(
        <GameModel>[],
        Response(
          requestOptions: RequestOptions(),
          statusCode: 200,
          statusMessage: 'OK',
          data: <GameModel>[],
        ),
      ),
    );
    final result = await gamesRepositoryImpl.getGames(1, 5);
    expect(result, isA<Right<Failure, List<Game>>>());
  });

  test('should return failure when getting games from the datasource fails', () async {
    final failure = UnknownFailure();
    when(() => mockDataSource.getGames(1, 5)).thenThrow(failure);
    final result = await gamesRepositoryImpl.getGames(1, 5);
    expect(result, isA<Left<Failure, List<Game>>>());
    expect((result as Left).value, isA<UnknownFailure>());
  });

  test('should return mock list of games, and mapped to entity', () async {
    when(() => mockDataSource.getGames(1, 5)).thenAnswer(
      (_) async => HttpResponse(
        mockGameModelList,
        Response(
          requestOptions: RequestOptions(),
          statusCode: 200,
          statusMessage: 'OK',
          data: mockGameModelList,
        ),
      ),
    );
    final result = await gamesRepositoryImpl.getGames(1, 5);
    expect(
      result,
      isA<Right<Failure, List<Game>>>(),
    );
    expect(
      (result as Right).value,
      containsAll(mockGameModelList.map((e) => e.toEntity()).toList()),
    );
  });
}
