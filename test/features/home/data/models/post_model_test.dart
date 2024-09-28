import 'package:flutter_test/flutter_test.dart';
import 'package:football/features/home/data/models/image_info_model.dart';
import 'package:football/features/home/data/models/post_images_model.dart';
import 'package:football/features/home/data/models/post_model.dart';
import 'package:football/features/home/domain/entities/post_entity.dart';

final mockJson = {
  'id': 1,
  'title': 'title',
  'description': 'description',
  'image_urls': {
    'large': {
      'url': '',
      'width': 100,
      'height': 100,
    },
    'medium': {
      'url': '',
      'width': 100,
      'height': 100,
    },
    'small': {
      'url': '',
      'width': 100,
      'height': 100,
    },
  },
  'created_at': '2024-01-01T00:00:00.000',
};
void main() {
  final testPostMode = PostModel(
    id: 1,
    title: 'title',
    description: 'description',
    imageUrls: const PostImagesModel(
      large: ImageInfoModel(url: '', width: 100, height: 100),
      medium: ImageInfoModel(url: '', width: 100, height: 100),
      small: ImageInfoModel(url: '', width: 100, height: 100),
    ),
    createdAt: DateTime(2024),
  );

  test('should convert from entity to model', () {
    final postEntity = testPostMode.toEntity();
    expect(postEntity, isA<Post>());
    expect(
      postEntity,
      Post(
        id: 1,
        title: 'title',
        description: 'description',
        imageUrls: const PostImages(
          large: ImageInfo(url: '', width: 100, height: 100),
          medium: ImageInfo(url: '', width: 100, height: 100),
          small: ImageInfo(url: '', width: 100, height: 100),
        ),
        createdAt: DateTime(2024),
      ),
    );
  });

  test('should convert from model to entity', () {
    final postModel = testPostMode.toEntity();
    expect(postModel, isA<Post>());
    expect(
      postModel,
      Post(
        id: 1,
        title: 'title',
        description: 'description',
        imageUrls: const PostImages(
          large: ImageInfo(url: '', width: 100, height: 100),
          medium: ImageInfo(url: '', width: 100, height: 100),
          small: ImageInfo(url: '', width: 100, height: 100),
        ),
        createdAt: DateTime(2024),
      ),
    );
  });
  test('should convert from json to model', () {
    final postModel = PostModel.fromJson(mockJson);
    expect(postModel, isA<PostModel>());
  });

  test('should convert from model to json', () {
    final json = testPostMode.toJson();

    expect(json['id'], 1);
    expect(json['title'], 'title');
    expect(json['description'], 'description');

    expect(json['image_urls'], isA<Map<String, dynamic>>());

    expect(json['image_urls'], testPostMode.imageUrls.toJson());

    expect(json['created_at'], '2024-01-01T00:00:00.000');
  });
}
