import 'package:football/features/home/data/models/posts/post_images_model.dart';
import 'package:football/features/home/domain/entities/post_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PostModel {
  const PostModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrls,
    required this.createdAt,
  });

  factory PostModel.fromEntity(Post entity) {
    return PostModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      imageUrls: entity.imageUrls == null ? null : PostImagesModel.fromEntity(entity.imageUrls!),
      createdAt: entity.createdAt,
    );
  }

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);

  final int id;
  final String title;
  final String description;
  final PostImagesModel? imageUrls;
  final DateTime createdAt;

  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  Post toEntity() {
    return Post(
      id: id,
      title: title,
      description: description,
      imageUrls: imageUrls?.toEntity(),
      createdAt: createdAt,
    );
  }
}
