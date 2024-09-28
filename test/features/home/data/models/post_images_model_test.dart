// ignore_for_file: avoid_dynamic_calls

import 'package:flutter_test/flutter_test.dart';
import 'package:football/features/home/data/models/image_info_model.dart';
import 'package:football/features/home/data/models/post_images_model.dart';
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
}
