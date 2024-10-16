part of 'games_cubit.dart';

@freezed
class GamesState with _$GamesState {
  const factory GamesState.initial() = _Initial;
  const factory GamesState.loading() = _Loading;
  const factory GamesState.loaded(List<Game> games) = _Loaded;
  const factory GamesState.error(Failure message) = _Error;
}
