import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:football/features/home/data/datasource/api/reel_datasource.dart';
import 'package:football/features/home/data/models/image_info_model.dart';
import 'package:football/features/home/data/models/posts/post_images_model.dart';
import 'package:football/features/home/data/models/reels/reel_model.dart';
import 'package:football/features/home/data/repository/reel_repository_impl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retrofit/retrofit.dart';

class MockReelDataSource extends Mock implements ReelDataSource {}

final mockListReel = [
  ReelModel(
    id: 1,
    title: 'title',
    createdAt: DateTime(2024),
    description: 'description',
    imageUrls: const PostImagesModel(
      large: ImageInfoModel(url: '', width: 100, height: 100),
      medium: ImageInfoModel(url: '', width: 100, height: 100),
      small: ImageInfoModel(url: '', width: 100, height: 100),
    ),
    videoUrl: 'videoUrls',
  ),
];
void main() {
  late ReelDataSource dataSource;
  late ReelRepositoryImpl repository;
  setUp(() {
    dataSource = MockReelDataSource();
    repository = ReelRepositoryImpl(datasource: dataSource);
  });
  group('ReelDataSource', () {
    test('should call getReels', () async {
      when(() => dataSource.getReels()).thenAnswer(
        (_) async => HttpResponse(
          mockListReel,
          Response(
            requestOptions: RequestOptions(),
            statusCode: 200,
            statusMessage: 'OK',
            data: mockListReel,
          ),
        ),
      );

      final result = await repository.getReels();

      final expected = mockListReel.map((e) => e.toEntity()).toList();

      expect(result.isRight(), isTrue);

      final actualList = result.getOrElse((failure) => []);

      expect(actualList, expected);
    });

    test('should return Left when getReels fails', () async {
      when(() => dataSource.getReels()).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          response: Response(
            requestOptions: RequestOptions(),
            statusCode: 404,
            statusMessage: 'Not Found',
          ),
        ),
      );

      final result = await repository.getReels();

      expect(result.isLeft(), isTrue);
    });
  });
}
