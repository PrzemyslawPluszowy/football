import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:football/features/home/data/models/game/game_model.dart';

void main() {
  late Map<String, dynamic> mockJson;

  setUpAll(() async {
    final file = File('test/features/home/data/models/game/game_response.json');
    mockJson = json.decode(await file.readAsString()) as Map<String, dynamic>;
  });

  final testGameModel = GameModel(
    id: 0,
    date: DateTime(2024),
    score: '1:0',
    homeClub: const ClubModel(
      id: 0,
      name: 'LKS Pisarowce',
      stadium: '233, 38-530 Pisarowce',
    ),
    awayClub: const ClubModel(
      id: 0,
      name: 'LKS Pisarowce',
      stadium: '233, 38-530 Pisarowce',
    ),
    createdAt: DateTime(2024),
  );

  test('should convert from model to json', () {
    final result = testGameModel.toJson();
    expect(result, mockJson);
  });

  test('should convert from json to model', () {
    final result = GameModel.fromJson(mockJson);

    expect(result, isA<GameModel>());
    expect(result.id, 0);
    expect(result.date, DateTime(2024));
    expect(result.score, '1:0');
    expect(result.homeClub, isA<ClubModel>());
    expect(result.awayClub, isA<ClubModel>());
    expect(result.createdAt, DateTime(2024));
  });
}
