import 'package:equatable/equatable.dart';
import 'package:football/core/utils/date_time_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class GameModel extends Equatable {
  const GameModel({
    required this.id,
    required this.date,
    required this.score,
    required this.homeClub,
    required this.awayClub,
    required this.createdAt,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) =>
      _$GameModelFromJson(json);

  final int id;
  final DateTime date;
  final String score;
  final ClubModel homeClub;
  final ClubModel awayClub;
  @DataTimaIsoConverter()
  final DateTime createdAt;

  Map<String, dynamic> toJson() => _$GameModelToJson(this);

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

  final int id;
  final String name;
  final String stadium;

  @override
  List<Object?> get props => [id];
}
