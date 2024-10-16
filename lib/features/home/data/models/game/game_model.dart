import 'package:equatable/equatable.dart';
import 'package:football/core/utils/date_time_converter.dart';
import 'package:football/features/home/domain/entities/game_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class GameModel extends Equatable {
  const GameModel({
    required this.id,
    required this.date,
    required this.homeClub,
    required this.awayClub,
    required this.createdAt,
    this.score,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) =>
      _$GameModelFromJson(json);

  final int id;
  final DateTime date;
  final String? score;
  final ClubModel homeClub;
  final ClubModel awayClub;
  @DataTimaIsoConverter()
  final DateTime createdAt;

  Map<String, dynamic> toJson() => _$GameModelToJson(this);

  Game toEntity() {
    return Game(
      id: id,
      date: date,
      score: score,
      homeClub: homeClub.toEntity(),
      awayClub: awayClub.toEntity(),
      createdAt: createdAt,
    );
  }

  @override
  List<Object?> get props => [id];
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ClubModel extends Equatable {
  const ClubModel({
    required this.id,
    required this.name,
    required this.stadium,
  });

  factory ClubModel.fromJson(Map<String, dynamic> json) =>
      _$ClubModelFromJson(json);

  final int id;
  final String name;
  final String stadium;

  Map<String, dynamic> toJson() => _$ClubModelToJson(this);

  Club toEntity() {
    return Club(
      id: id,
      name: name,
      stadium: stadium,
    );
  }

  @override
  List<Object?> get props => [id];
}
