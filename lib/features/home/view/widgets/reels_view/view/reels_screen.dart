import 'package:auto_route/auto_route.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:football/common/widgets/cashed_image.dart';
import 'package:football/features/home/domain/entities/reeel_entity.dart';
import 'package:video_player/video_player.dart';

@RoutePage()
class ReelsScreen extends StatelessWidget {
  ReelsScreen({required this.reels, required this.selectedId, super.key});

  final List<Reel> reels;
  final int selectedId;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: PageView.builder(
        controller: pageController,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: reels.length,
        itemBuilder: (context, index) {
          return SamplePlayer(reel: reels, index: index);
        },
      ),
    );
  }
}

class SamplePlayer extends StatefulWidget {
  const SamplePlayer({required this.reel, required this.index, super.key});

  final List<Reel> reel;
  final int index;

  @override
  SamplePlayerState createState() => SamplePlayerState();
}

class SamplePlayerState extends State<SamplePlayer> {
  late FlickManager flickManager;
  late bool isVideo = widget.reel[widget.index].videoUrls != null;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(
          widget.reel[widget.index].videoUrls?.small ?? '',
        ),
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isVideo) {
      return Container(
        child: CashedImage(
          imageUrl: widget.reel[widget.index].imageUrls?.large.url ?? '',
          width: MediaQuery.of(context).size.width.toInt(),
          height: MediaQuery.of(context).size.height.toInt(),
        ),
      );
    }
    return Container(
      child: FlickVideoPlayer(
        flickVideoWithControlsFullscreen: const SizedBox(),
        flickManager: flickManager,
      ),
    );
  }
}
