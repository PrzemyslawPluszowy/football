import 'package:bloc/bloc.dart';
import 'package:football/core/failures/failure.dart';
import 'package:football/features/home/domain/entities/reeel_entity.dart';
import 'package:football/features/home/domain/usecases/get_reels_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reels_cubit.freezed.dart';
part 'reels_state.dart';

class ReelsCubit extends Cubit<ReelsState> {
  ReelsCubit({
    required this.getReelsUseCase,
  }) : super(const ReelsState.loading());

  final GetReelsUseCase getReelsUseCase;

  Future<void> getReels() async {
    emit(const ReelsState.loading());
    final result = await getReelsUseCase.call();
    result.fold(
      (failure) => emit(ReelsState.error(failure)),
      (reels) => emit(ReelsState.loaded(reels)),
    );
  }
}
