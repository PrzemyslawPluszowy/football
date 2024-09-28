import 'package:flutter_test/flutter_test.dart';
import 'package:football/features/home/data/models/image_info_model.dart';
import 'package:football/features/home/data/models/post_images_model.dart';
import 'package:football/features/home/data/models/post_model.dart';
import 'package:football/features/home/domain/entities/post_entity.dart';

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
}
