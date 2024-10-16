import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_entity.freezed.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required int id,
    required String title,
    required String description,
    required PostImages? imageUrls,
    required DateTime createdAt,
  }) = _PostEntity;
}

@freezed
class PostImages with _$PostImages {
  const factory PostImages({
    required ImageInfo large,
    required ImageInfo medium,
    required ImageInfo small,
  }) = _PostImages;
}

@freezed
class ImageInfo with _$ImageInfo {
  const factory ImageInfo({
    required String url,
    required int width,
    required int height,
  }) = _ImageInfo;
}
