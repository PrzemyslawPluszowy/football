import 'package:flutter_test/flutter_test.dart';
import 'package:football/core/failures/failure.dart';
import 'package:football/features/home/domain/entities/post_entity.dart';
import 'package:football/features/home/domain/repositories/post_repository.dart';
import 'package:football/features/home/domain/usecases/get_post_usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockPostRepository extends Mock implements PostRepository {}

final ImageInfo mockImageInfo = ImageInfo(url: '', width: 100, height: 100);
final Post mockPost = Post(
  createdAt: DateTime(2024),
  id: 0,
  description: '',
  imageUrls: PostImages(
    large: mockImageInfo,
    medium: mockImageInfo,
    small: mockImageInfo,
  ),
  title: 'title',
);
void main() {
  late MockPostRepository mockPostRepository;
  late GetPostUseCase getPostsUseCase;

  setUp(() {
    mockPostRepository = MockPostRepository();
    getPostsUseCase = GetPostUseCase(repository: mockPostRepository);
  });

  test('should get post from the repository', () async {
    when(() => mockPostRepository.getPost(1))
        .thenAnswer((_) async => Right(mockPost));
    final result = await getPostsUseCase(1);
    expect(result, Right<Failure, Post>(mockPost));
  });

  test('show be return serverError', () async {
    final failure = ServerFailure();
    when(() => mockPostRepository.getPost(1))
        .thenAnswer((_) async => Left(failure));
    final result = await getPostsUseCase(1);
    expect(result, Left<Failure, Post>(failure));
  });
}
