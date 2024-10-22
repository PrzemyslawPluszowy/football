import 'package:football/core/utils/date_time_converter.dart';
import 'package:football/features/home/data/models/posts/post_images_model.dart';
import 'package:football/features/home/domain/entities/reeel_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reel_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ReelModel {
  ReelModel({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.imageUrls,
    this.description,
    this.videoUrl,
  });

  factory ReelModel.fromJson(Map<String, dynamic> json) =>
      _$ReelModelFromJson(json);

  final int id;
  final String title;
  final String? description;
  final PostImagesModel imageUrls;
  final String? videoUrl;
  @DataTimaIsoConverter()
  final DateTime createdAt;

  Reel toEntity() {
    return Reel(
      id: id,
      title: title,
      description: description,
      imageUrls: imageUrls.toEntity(),
      videoUrl: videoUrl,
      createdAt: createdAt,
    );
  }

  Map<String, dynamic> toJson() => _$ReelModelToJson(this);
}
