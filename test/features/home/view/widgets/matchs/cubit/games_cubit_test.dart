import 'package:bloc_test/bloc_test.dart';
import 'package:football/core/failures/failure.dart';
import 'package:football/features/home/domain/entities/game_entity.dart';
import 'package:football/features/home/domain/usecases/get_games_usecase.dart';
import 'package:football/features/home/view/widgets/matchs/cubit/games_cubit.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockGetGameUseCase extends Mock implements GetGamesUsecase {}

final mockListGame = <Game>[
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
  late MockGetGameUseCase mockGetGameUseCase;

  blocTest<GamesCubit, GamesState>(
    ' should get games from the usecase empty',
    setUp: () {
      mockGetGameUseCase = MockGetGameUseCase();
      when(
        () => mockGetGameUseCase.call(const PaginatedParam(page: 1, limit: 5)),
      ).thenAnswer((_) async => const Right([]));
    },
    build: () {
      return GamesCubit(getGamesUsecase: mockGetGameUseCase);
    },
    act: (bloc) => bloc.getGames(),
    expect: () => [
      const GamesState.loading(),
      const GamesState.loaded([]),
    ],
  );

  blocTest<GamesCubit, GamesState>(
    ' should get mock  games from the usecase',
    setUp: () {
      mockGetGameUseCase = MockGetGameUseCase();
      when(
        () => mockGetGameUseCase.call(const PaginatedParam(page: 1, limit: 5)),
      ).thenAnswer((_) async => Right(mockListGame));
    },
    build: () {
      return GamesCubit(getGamesUsecase: mockGetGameUseCase);
    },
    act: (bloc) => bloc.getGames(),
    expect: () => [
      const GamesState.loading(),
      GamesState.loaded(mockListGame),
    ],
  );

  blocTest<GamesCubit, GamesState>(
    ' should get games from the usecase fail',
    setUp: () {
      mockGetGameUseCase = MockGetGameUseCase();
      when(
        () => mockGetGameUseCase.call(const PaginatedParam(page: 1, limit: 5)),
      ).thenAnswer((_) async => Left(UnknownFailure()));
    },
    build: () {
      return GamesCubit(getGamesUsecase: mockGetGameUseCase);
    },
    act: (bloc) => bloc.getGames(),
    expect: () => [
      const GamesState.loading(),
      GamesState.error(UnknownFailure()),
    ],
  );
}
