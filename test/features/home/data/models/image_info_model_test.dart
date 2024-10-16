import 'package:flutter_test/flutter_test.dart';
import 'package:football/features/home/data/models/posts/image_info_model.dart';
import 'package:football/features/home/domain/entities/post_entity.dart';

void main() {
  // Mockowe dane ImageInfoModel
  const imageInfoMock = ImageInfoModel(
    url: 'url',
    width: 100,
    height: 100,
  );

  // Mockowe dane w formacie JSON
  final imageInfoJsonMock = {
    'url': 'url',
    'width': 100,
    'height': 100,
  };

  group('ImageInfoModel', () {
    test('should convert from json to model', () {
      // Konwersja z JSON na model
      final result = ImageInfoModel.fromJson(imageInfoJsonMock);

      // Sprawdzenie poprawności konwersji
      expect(result, isA<ImageInfoModel>());
      expect(result.url, 'url');
      expect(result.width, 100);
      expect(result.height, 100);
    });

    test('should convert from model to json', () {
      // Konwersja z modelu na JSON
      final result = imageInfoMock.toJson();

      // Sprawdzenie poprawności konwersji
      expect(result, imageInfoJsonMock);
    });

    test('should convert from model to entity', () {
      // Konwersja z modelu na encję
      final result = imageInfoMock.toEntity();

      // Sprawdzenie poprawności konwersji
      expect(result, isA<ImageInfo>());
      expect(result.url, 'url');
      expect(result.width, 100);
      expect(result.height, 100);
    });

    test('should convert from entity to model', () {
      // Konwersja z encji na model
      final result = ImageInfoModel.fromEntity(
        const ImageInfo(url: 'url', width: 100, height: 100),
      );

      // Sprawdzenie poprawności konwersji
      expect(result, isA<ImageInfoModel>());
      expect(result.url, 'url');
      expect(result.width, 100);
      expect(result.height, 100);
    });
  });
}
