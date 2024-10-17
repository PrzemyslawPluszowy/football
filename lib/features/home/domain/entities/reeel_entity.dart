import 'package:football/features/home/domain/entities/post_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reeel_entity.freezed.dart';

@freezed
class Reel with _$Reel {
  const factory Reel({
    required int id,
    required String title,
    required String? description,
    required DateTime createdAt,
    required VideoUrls? videoUrls,
    PostImages? imageUrls,
  }) = _ReelEntity;
}

@freezed
class VideoUrls with _$VideoUrls {
  const factory VideoUrls({
    required String small,
  }) = _VideoUrls;
}
