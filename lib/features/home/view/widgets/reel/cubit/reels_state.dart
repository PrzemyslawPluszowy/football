part of 'reels_cubit.dart';

@freezed
class ReelsState with _$ReelsState {
  const factory ReelsState.loading() = _Loading;
  const factory ReelsState.loaded(List<Reel> reels) = _Loaded;
  const factory ReelsState.error(Failure message) = _Error;
}
