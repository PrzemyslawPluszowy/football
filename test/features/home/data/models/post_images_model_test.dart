// ignore_for_file: avoid_dynamic_calls

import 'package:flutter_test/flutter_test.dart';
import 'package:football/features/home/data/models/image_info_model.dart';
import 'package:football/features/home/data/models/posts/post_images_model.dart';
import 'package:football/features/home/domain/entities/post_entity.dart';

void main() {
  final jsonmock = {
    'large': {
      'url': 'url',
      'width': 100,
      'height': 100,
    },
    'medium': {
      'url': 'url',
      'width': 100,
      'height': 100,
    },
    'small': {
      'url': 'url',
      'width': 100,
      'height': 100,
    },
  };
  const testPostImagesModel = PostImagesModel(
    large: ImageInfoModel(
      url: 'url',
      width: 100,
      height: 100,
    ),
    medium: ImageInfoModel(
      url: 'url',
      width: 100,
      height: 100,
    ),
    small: ImageInfoModel(
      url: 'url',
      width: 100,
      height: 100,
    ),
  );

  test('should convert from entity to model', () {
    final postImagesEntity = testPostImagesModel.toEntity();
    expect(postImagesEntity, isA<PostImages>());
    expect(
      postImagesEntity,
      const PostImages(
        large: ImageInfo(
          url: 'url',
          width: 100,
          height: 100,
        ),
        medium: ImageInfo(
          url: 'url',
          width: 100,
          height: 100,
        ),
        small: ImageInfo(
          url: 'url',
          width: 100,
          height: 100,
        ),
      ),
    );
  });
  test('should convert from json to model', () {
    final postImagesModel = PostImagesModel.fromJson(jsonmock);
    expect(postImagesModel, isA<PostImagesModel>());
  });

  test('should convert from model to json', () {
    final json = testPostImagesModel.toJson();

    expect(json, jsonmock);
  });

  test('should convert from model to entity', () {
    final postImagesModel = testPostImagesModel.toEntity();
    expect(postImagesModel, isA<PostImages>());
    expect(
      postImagesModel,
      const PostImages(
        large: ImageInfo(
          url: 'url',
          width: 100,
          height: 100,
        ),
        medium: ImageInfo(
          url: 'url',
          width: 100,
          height: 100,
        ),
        small: ImageInfo(
          url: 'url',
          width: 100,
          height: 100,
        ),
      ),
    );
  });
  group('PostImagesModel', () {
    test('should convert from entity to PostImagesModel', () {
      // Mockowe dane encji PostImages
      const postImagesEntity = PostImages(
        large: ImageInfo(url: '', width: 100, height: 100),
        medium: ImageInfo(url: '', width: 100, height: 100),
        small: ImageInfo(url: '', width: 100, height: 100),
      );

      // Konwersja encji na model
      final postImagesModel = PostImagesModel.fromEntity(postImagesEntity);

      // Sprawdzenie poprawności konwersji
      expect(postImagesModel, isA<PostImagesModel>());
      expect(postImagesModel.large.width, 100);
      expect(postImagesModel.medium.width, 100);
      expect(postImagesModel.small.width, 100);
    });

    test('should convert from PostImagesModel to json', () {
      // Mockowe dane modelu PostImagesModel
      const postImagesModel = PostImagesModel(
        large: ImageInfoModel(url: '', width: 100, height: 100),
        medium: ImageInfoModel(url: '', width: 100, height: 100),
        small: ImageInfoModel(url: '', width: 100, height: 100),
      );

      // Konwersja modelu na JSON
      final json = postImagesModel.toJson();

      // Sprawdzenie poprawności konwersji
      expect(json['large'], isA<Map<String, dynamic>>());
      expect(json['large']['width'], 100);
      expect(json['medium']['width'], 100);
      expect(json['small']['width'], 100);
    });
  });
}
