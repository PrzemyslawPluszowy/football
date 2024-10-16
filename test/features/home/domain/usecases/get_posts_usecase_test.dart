import 'package:flutter_test/flutter_test.dart';
import 'package:football/core/failures/failure.dart';
import 'package:football/features/home/domain/entities/post_entity.dart';
import 'package:football/features/home/domain/repositories/post_repository.dart';
import 'package:football/features/home/domain/usecases/get_posts_usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockPostRepository extends Mock implements PostRepository {}

const ImageInfo mockImageInfo = ImageInfo(url: '', width: 100, height: 100);

void main() {
  late GetPostsUseCase getPostsUseCase;
  late MockPostRepository mockPostRepository;

  setUp(() {
    mockPostRepository = MockPostRepository();
    getPostsUseCase = GetPostsUseCase(repository: mockPostRepository);
  });

  final mockPostList = <Post>[
    Post(
      createdAt: DateTime(2024),
      id: 0,
      description: '',
      imageUrls: const PostImages(
        large: mockImageInfo,
        medium: mockImageInfo,
        small: mockImageInfo,
      ),
      title: 'title',
    ),
  ];

  test('should get posts from the repository', () async {
    when(() => mockPostRepository.getPosts(1, 10)).thenAnswer((_) async => Right(mockPostList));
    final result = await getPostsUseCase(PaginatedParam(page: 1, limit: 10));
    expect(result, Right<Failure, List<Post>>(mockPostList));
  });

  test('should return failure when getting posts from the repository fails', () async {
    final failure = ServerFailure();
    when(() => mockPostRepository.getPosts(1, 10)).thenAnswer((_) async => Left(failure));
    final result = await getPostsUseCase(PaginatedParam(page: 1, limit: 10));
    expect(result, Left<Failure, List<Post>>(failure));
  });
}
