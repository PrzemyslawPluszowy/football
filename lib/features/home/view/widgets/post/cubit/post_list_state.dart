part of 'post_list_cubit.dart';

@freezed
class PostListState with _$PostListState {
  const factory PostListState.initial() = _Initial;
  const factory PostListState.loading() = _Loading;
  const factory PostListState.showList(
      {required List<Post> posts,
      required bool hasReachedMax,
      required bool isFetching}) = _ShowList;
  const factory PostListState.error(Failure message) = _Error;
}
