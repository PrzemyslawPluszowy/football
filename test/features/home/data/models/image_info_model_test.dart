import 'package:flutter_test/flutter_test.dart';
import 'package:football/features/home/data/models/image_info_model.dart';
import 'package:football/features/home/domain/entities/post_entity.dart';

void main() {
  const mock = ImageInfoModel(
    url: 'url',
    width: 100,
    height: 100,
  );

  final jsonMock = {
    'url': 'url',
    'width': 100,
    'height': 100,
  };

  test('should convert from json to model', () {
    final result = ImageInfoModel.fromJson(jsonMock);
    expect(result, isA<ImageInfoModel>());
  });

  test('should convert from model to json', () {
    final result = mock.toJson();
    expect(result, jsonMock);
  });

  test('should convert  to Entity ', () {
    final result = mock.toEntity();
    expect(result, isA<ImageInfo>());
    expect(result, const ImageInfo(url: 'url', width: 100, height: 100));
  });

  test('should convert from entity to model', () {
    final result = ImageInfoModel.formEntity(
      const ImageInfo(url: 'url', width: 100, height: 100),
    );
    expect(result.height == 100, true);
    expect(result.url == 'url', true);
    expect(result.width == 100, true);
    expect(result, isA<ImageInfoModel>());
  });
}
