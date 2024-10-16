import 'package:bloc/bloc.dart';
import 'package:football/core/failures/failure.dart';
import 'package:football/features/home/domain/entities/game_entity.dart';
import 'package:football/features/home/domain/usecases/get_games_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'games_cubit.freezed.dart';
part 'games_state.dart';

class GamesCubit extends Cubit<GamesState> {
  GamesCubit({
    required this.getGamesUsecase,
  }) : super(const GamesState.initial());

  final GetGamesUsecase getGamesUsecase;

  ///At this moment this function don't use pagination logic,
  /// only show last 5 games
  static const PaginatedParam paginatedParam =
      PaginatedParam(page: 1, limit: 5);

  Future<void> getGames() async {
    emit(const GamesState.loading());
    final result = await getGamesUsecase(paginatedParam);
    result.fold(
      (failure) => emit(GamesState.error(failure)),
      (games) => emit(GamesState.loaded(games)),
    );
  }
}
