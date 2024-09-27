import 'package:bloc/bloc.dart';
import 'package:football/core/failures/failure.dart';
import 'package:football/features/home/domain/entities/post_entity.dart';
import 'package:football/features/home/domain/usecases/get_posts_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_list_cubit.freezed.dart';
part 'post_list_state.dart';

class PostListCubit extends Cubit<PostListState> {
  PostListCubit({
    required this.getPostsUseCase,
  }) : super(PostListState.initial());

  final GetPostsUseCase getPostsUseCase;
  var page = 1;
  static const limit = 30;

  Future<void> getPosts() async {
    if (!_canFetchPosts()) return;
    if (state is _Initial) {
      emit(PostListState.loading());
    } else {
      final currentState = state as _ShowList;
      emit(currentState.copyWith(isFetching: true));
    }
    final result =
        await getPostsUseCase.call(PaginatedParam(page: page, limit: limit));
    result.fold(
      (failure) => emit(PostListState.error(failure)),
      (posts) => _handlePostsResponse(posts),
    );
  }

  bool _canFetchPosts() {
    if (state is _Loading) return false;
    if (state is _ShowList) {
      final currentState = state as _ShowList;
      return !currentState.hasReachedMax && !currentState.isFetching;
    }
    return true;
  }

  void _handlePostsResponse(List<Post> newPosts) {
    final oldPosts = state.maybeWhen(
      showList: (posts, hasReachedMax, isFetching) => posts,
      orElse: () => <Post>[],
    );

    if (newPosts.isEmpty) {
      emit(PostListState.showList(
          posts: oldPosts, hasReachedMax: true, isFetching: false));
    } else if (newPosts.length < limit) {
      emit(PostListState.showList(
          posts: [...oldPosts, ...newPosts],
          hasReachedMax: true,
          isFetching: false));
    } else {
      page++;
      emit(PostListState.showList(
          posts: [...oldPosts, ...newPosts],
          hasReachedMax: false,
          isFetching: false));
    }
  }

  Future<void> refreshPosts() async {
    page = 1;
    emit(PostListState.initial());
    await getPosts();
  }
}
