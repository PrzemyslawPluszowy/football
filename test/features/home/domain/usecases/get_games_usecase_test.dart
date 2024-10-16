import 'package:flutter_test/flutter_test.dart';
import 'package:football/core/failures/failure.dart';
import 'package:football/features/home/data/repository/games_repository_impl.dart';
import 'package:football/features/home/domain/entities/game_entity.dart';
import 'package:football/features/home/domain/usecases/get_games_usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockGameRepository extends Mock implements GamesRepositoryImpl {}

final mockGameList = <Game>[
  Game(
    id: 1,
    date: DateTime(2024),
    homeClub: const Club(id: 1, name: 'name1', stadium: 'stadium1'),
    score: null,
    awayClub: const Club(id: 2, name: 'name2', stadium: 'stadium2'),
    createdAt: DateTime(2024),
  ),
  Game(
    id: 2,
    date: DateTime(2024),
    homeClub: const Club(id: 1, name: 'name1', stadium: 'stadium1'),
    score: null,
    awayClub: const Club(id: 2, name: 'name2', stadium: 'stadium2'),
    createdAt: DateTime(2024),
  ),
];

void main() {
  late MockGameRepository mockGameRepository;
  late GetGamesUsecase getGamesUseCase;

  setUp(() {
    mockGameRepository = MockGameRepository();
    getGamesUseCase = GetGamesUsecase(mockGameRepository);
  });

  test('should get games from the repository', () async {
    when(() => mockGameRepository.getGames(1, 5)).thenAnswer((_) async => Right(mockGameList));
    final result = await getGamesUseCase(const PaginatedParam(page: 1, limit: 5));
    expect(result, Right<Failure, List<Game>>(mockGameList));
  });

  test('should return failure when getting games from the repository fails', () async {
    final failure = ServerFailure();
    when(() => mockGameRepository.getGames(1, 5)).thenAnswer((_) async => Left(failure));
    final result = await getGamesUseCase(const PaginatedParam(page: 1, limit: 5));
    expect(result, Left<Failure, List<Game>>(failure));
  });
}
