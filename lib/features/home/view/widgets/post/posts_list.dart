import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/common/widgets/custom_error_widget.dart';
import 'package:football/common/widgets/shimmer_loading_container.dart';
import 'package:football/core/extensions/string_hc.dart';
import 'package:football/core/theme/app_sizes.dart';
import 'package:football/features/home/view/widgets/post/cubit/post_list_cubit.dart';
import 'package:football/features/home/view/widgets/post/post_item.dart';

class PostsList extends StatelessWidget {
  const PostsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostListCubit, PostListState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SliverToBoxAdapter(
            child: ShimmerLoadingContainer(height: 400),
          ),
          loading: () => const SliverToBoxAdapter(
            child: ShimmerLoadingContainer(height: 400),
          ),
          error: (message) => SliverToBoxAdapter(child: CustomErrorWidget(message: message)),
          showList: (posts, hasReachedMax, isFetchingMore) => SliverList.separated(
            separatorBuilder: (context, index) => gapH12,
            itemCount: posts.length + (hasReachedMax || isFetchingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == posts.length) {
                // Jeśli trwa pobieranie kolejnych postów
                if (isFetchingMore && !hasReachedMax) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                // Jeśli nie ma więcej postów do załadowania
                if (hasReachedMax) {
                  return Container(
                    height: Sizes.p48,
                    alignment: Alignment.center,
                    child: Text('No more posts'.hardcoded),
                  );
                }
              }
              final post = posts[index];

              return PostItem(
                title: post.title,
                description: post.description,
                imageUrl: post.imageUrls?.medium.url,
                createdAt: post.createdAt,
                imageHeight: post.imageUrls?.medium.height,
                imageWidth: post.imageUrls?.medium.width,
              );
            },
          ),
        );
      },
    );
  }
}
