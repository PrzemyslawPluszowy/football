import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:football/core/failures/failure.dart';
import 'package:football/features/home/domain/entities/post_entity.dart';
import 'package:football/features/home/domain/entities/reeel_entity.dart';
import 'package:football/features/home/domain/usecases/get_reels_usecase.dart';
import 'package:football/features/home/view/widgets/reel/cubit/reels_cubit.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockGetReelsUseCase extends Mock implements GetReelsUseCase {}

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
  late MockGetReelsUseCase mockGetReelsUseCase;
  setUp(() {
    mockGetReelsUseCase = MockGetReelsUseCase();
  });

  blocTest<ReelsCubit, ReelsState>(
    '''
emits [ReelsState.loading, ReelsState.loaded] 
    when GetReelsUseCase is successful''',
    build: () {
      when(() => mockGetReelsUseCase.call()).thenAnswer(
        (_) async => Right(mockListReel),
      );
      return ReelsCubit(getReelsUseCase: mockGetReelsUseCase);
    },
    act: (cubit) => cubit.getReels(),
    expect: () => [const ReelsState.loading(), ReelsState.loaded(mockListReel)],
  );

  blocTest<ReelsCubit, ReelsState>(
    '''
 emits [ReelsState.loading, ReelsState.error] 
    when GetReelsUseCase is unsuccessful''',
    build: () {
      when(() => mockGetReelsUseCase.call()).thenAnswer(
        (_) async => Left(ServerFailure()),
      );
      return ReelsCubit(getReelsUseCase: mockGetReelsUseCase);
    },
    act: (cubit) => cubit.getReels(),
    expect: () =>
        [const ReelsState.loading(), ReelsState.error(ServerFailure())],
  );
}
