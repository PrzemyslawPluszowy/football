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
    this.description,
    this.imageUrls,
    this.videoUrls,
  });

  factory ReelModel.fromJson(Map<String, dynamic> json) =>
      _$ReelModelFromJson(json);

  final int id;
  final String title;
  final String? description;
  final PostImagesModel? imageUrls;
  final VideoUrlsModel? videoUrls;
  @DataTimaIsoConverter()
  final DateTime createdAt;

  Reel toEntity() {
    return Reel(
      id: id,
      title: title,
      description: description,
      imageUrls: imageUrls?.toEntity(),
      videoUrls: videoUrls == null ? null : VideoUrls(small: videoUrls!.small),
      createdAt: createdAt,
    );
  }

  Map<String, dynamic> toJson() => _$ReelModelToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class VideoUrlsModel {
  VideoUrlsModel({
    required this.small,
  });

  factory VideoUrlsModel.fromJson(Map<String, dynamic> json) =>
      _$VideoUrlsModelFromJson(json);

  final String small;

  VideoUrls toEntity() {
    return VideoUrls(
      small: small,
    );
  }

  Map<String, dynamic> toJson() => _$VideoUrlsModelToJson(this);
}




// [
//   {
//     "id": 0,
//     "title": "string",
//     "description": "string",
//     "image_urls": {
//       "large": {
//         "url": "http://localhost/storage/1/conversions/puchar_historia_512-large.webp",
//         "width": 500,
//         "height": 500
//       },
//       "medium": {
//         "url": "http://localhost/storage/1/conversions/puchar_historia_512-medium.webp",
//         "width": 300,
//         "height": 300
//       },
//       "small": {
//         "url": "http://localhost/storage/1/conversions/puchar_historia_512-small.webp",
//         "width": 150,
//         "height": 150
//       }
//     },
//     "video_urls": {
//       "small": "http://localhost/storage/5/small.webm"
//     },
//     "created_at": "2024-09-14T17:15:07.000000Z"
//   }
// ]
