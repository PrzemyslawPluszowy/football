import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/common/widgets/main_app_bar.dart';
import 'package:football/core/extensions/string_hc.dart';
import 'package:football/core/theme/app_sizes.dart';
import 'package:football/core/theme/custom_colors.dart';
import 'package:football/features/home/view/widgets/label.dart';
import 'package:football/features/home/view/widgets/matchs/matches_list.dart';
import 'package:football/features/home/view/widgets/post/cubit/post_list_cubit.dart';
import 'package:football/features/home/view/widgets/post/posts_list.dart';
import 'package:football/features/home/view/widgets/reel/reels_list.dart';
import 'package:football/main_development.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent - 400 &&
          !_scrollController.position.outOfRange) {
        talker.debug('run');
        context.read<PostListCubit>().getPosts();
      }
    });
    return Scaffold(
      backgroundColor: context.customColors!.background,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(Sizes.p56),
        child: MainAppBar(),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<PostListCubit>().refreshPosts();
        },
        child: CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(bottom: Sizes.p8),
                color: context.customColors?.background?.withOpacity(0.2) ??
                    Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Label(text: 'Stories'.hardcoded),
                    const ReelsList(),
                    Label(text: 'Next Match'.hardcoded),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: MatchesList(),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: Sizes.p8),
                color: context.customColors?.background?.withOpacity(0.5) ??
                    Colors.white,
                child: Label(text: "What's new?".hardcoded),
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.p12),
              sliver: PostsList(),
            ),
          ],
        ),
      ),
    );
  }
}
