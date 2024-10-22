import 'package:flutter_test/flutter_test.dart';
import 'package:football/core/failures/failure.dart';
import 'package:football/features/home/domain/entities/post_entity.dart';
import 'package:football/features/home/domain/entities/reeel_entity.dart';
import 'package:football/features/home/domain/repositories/reel_repository.dart';
import 'package:football/features/home/domain/usecases/get_reels_usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockReelRepository extends Mock implements ReelRepository {}

final mockListReel = [
  Reel(
    id: 1,
    title: 'title',
    createdAt: DateTime(2024),
    description: 'description',
    imageUrls: const PostImages(
      large: ImageInfo(url: '', width: 100, height: 100),
      medium: ImageInfo(url: '', width: 100, height: 100),
      small: ImageInfo(url: '', width: 100, height: 100),
    ),
    videoUrl: 'videoUrls',
  ),
];
void main() {
  late MockReelRepository mockReelRepository;
  late GetReelsUseCase getReelsUseCase;

  setUp(() {
    mockReelRepository = MockReelRepository();
    getReelsUseCase = GetReelsUseCase(repository: mockReelRepository);
  });

  test('should get reels from the repository', () async {
    when(() => mockReelRepository.getReels())
        .thenAnswer((_) async => right(mockListReel));

    final result = await getReelsUseCase.call();

    expect(result, right<Failure, List<Reel>>(mockListReel));
  });

  test('should return failure when getting reels from the repository fails',
      () async {
    final failure = ServerFailure();
    when(() => mockReelRepository.getReels())
        .thenAnswer((_) async => left(failure));

    final result = await getReelsUseCase.call();

    expect(result, left<Failure, List<Reel>>(failure));
  });
}
