import 'package:football/features/home/data/models/image_info_model.dart';
import 'package:football/features/home/domain/entities/post_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_images_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PostImagesModel {
  const PostImagesModel({
    required this.large,
    required this.medium,
    required this.small,
  });

  factory PostImagesModel.fromJson(Map<String, dynamic> json) =>
      _$PostImagesModelFromJson(json);

  factory PostImagesModel.fromEntity(PostImages entity) {
    return PostImagesModel(
      large: ImageInfoModel(
        url: entity.large.url,
        width: entity.large.width,
        height: entity.large.height,
      ),
      medium: ImageInfoModel(
        url: entity.medium.url,
        width: entity.medium.width,
        height: entity.medium.height,
      ),
      small: ImageInfoModel(
        url: entity.small.url,
        width: entity.small.width,
        height: entity.small.height,
      ),
    );
  }
  final ImageInfoModel large;
  final ImageInfoModel medium;
  final ImageInfoModel small;

  PostImages toEntity() {
    return PostImages(
      large: ImageInfo(
        url: large.url,
        width: large.width,
        height: large.height,
      ),
      medium: ImageInfo(
        url: medium.url,
        width: medium.width,
        height: medium.height,
      ),
      small: ImageInfo(
        url: small.url,
        width: small.width,
        height: small.height,
      ),
    );
  }

  Map<String, dynamic> toJson() => _$PostImagesModelToJson(this);
}
