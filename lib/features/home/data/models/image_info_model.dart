import 'package:json_annotation/json_annotation.dart';

part 'image_info_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ImageInfoModel {
  const ImageInfoModel({
    required this.url,
    required this.width,
    required this.height,
  });

  factory ImageInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ImageInfoModelFromJson(json);

  final String url;
  final int width;
  final int height;

  Map<String, dynamic> toJson() => _$ImageInfoModelToJson(this);
}
