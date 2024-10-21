import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:football/features/home/data/models/posts/post_images_model.dart';
import 'package:football/features/home/data/models/reels/reel_model.dart';
import 'package:football/features/home/domain/entities/post_entity.dart';
import 'package:football/features/home/domain/entities/reeel_entity.dart';

void main() {
  late Map<String, dynamic> mockJson;

  setUpAll(() async {
    final file =
        File('test/features/home/data/models/reels/reels_example.json');
    mockJson = json.decode(await file.readAsString()) as Map<String, dynamic>;
  });

  group('test model', () {
    test('should convert from json to model', () {
      final result = ReelModel.fromJson(mockJson);

      expect(result, isA<ReelModel>());
      expect(result.id, 0);
      expect(result.title, 'string');
      expect(result.description, 'string');
      expect(result.imageUrls, isA<PostImagesModel?>());
      expect(result.videoUrl, 'string');
      expect(result.createdAt, DateTime.parse('2024-09-14T17:15:07.000000Z'));
    });

    test('convert from json and map to entity', () {
      final result = ReelModel.fromJson(mockJson).toEntity();

      expect(result, isA<Reel>());
      expect(result.id, 0);
      expect(result.title, 'string');
      expect(result.description, 'string');
      expect(result.imageUrls, isA<PostImages>());
      expect(result.videoUrl, 'string');
      expect(result.createdAt, DateTime.parse('2024-09-14T17:15:07.000000Z'));
    });

    test('to json test', () {
      final result = ReelModel.fromJson(mockJson).toJson();

      // Porównanie ręczne pól
      expect(result['id'], mockJson['id']);
      expect(result['title'], mockJson['title']);
      expect(result['description'], mockJson['description']);
      expect(result['image_urls'], mockJson['image_urls']);
      expect(result['video_url'], mockJson['video_url']);

      // Normalizacja formatu daty
      expect(
        DateTime.parse(result['created_at'] as String).toUtc(),
        DateTime.parse(mockJson['created_at'] as String).toUtc(),
      );
    });
  });
}
