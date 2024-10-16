import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_entity.freezed.dart';

@freezed
class Game with _$Game {
  const factory Game({
    required int id,
    required DateTime date,
    required String? score,
    required Club homeClub,
    required Club awayClub,
    required DateTime createdAt,
  }) = _GameEntity;
}

@freezed
class Club with _$Club {
  const factory Club({
    required int id,
    required String name,
    required String stadium,
  }) = _Club;
}
