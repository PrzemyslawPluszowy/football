import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:football/common/widgets/cashed_image.dart';
import 'package:football/core/extensions/context_text_theme.dart';
import 'package:football/core/extensions/string_hc.dart';
import 'package:football/core/theme/app_sizes.dart';
import 'package:football/features/home/domain/entities/reeel_entity.dart';
import 'package:football/features/home/view/widgets/reels_view/view/widgets/close_button_overlay.dart';
import 'package:football/features/home/view/widgets/reels_view/view/widgets/reel_description.dart';
import 'package:video_player/video_player.dart';

class ReelPlayer extends StatefulWidget {
  const ReelPlayer({
    required this.reel,
    required this.pageController,
    super.key,
  });

  final Reel reel;
  final PageController pageController;

  @override
  ReelPlayerState createState() => ReelPlayerState();
}

class ReelPlayerState extends State<ReelPlayer> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    if (widget.reel.videoUrl == null) {
      return;
    }
    flickManager = FlickManager(
      onVideoEnd: _onVideoEnd,
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(
          widget.reel.videoUrl!,
        ),
      ),
    );
  }

  void _onVideoEnd() {
    widget.pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    if (widget.reel.videoUrl != null) flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isVideo = widget.reel.videoUrl != null;

    return Stack(
      fit: StackFit.expand,
      children: [
        if (isVideo) _buildVideoPlayer() else _buildImage(),
        ReelDescription(reel: widget.reel),
        const CloseButtonOverlay(),
      ],
    );
  }

  Widget _buildVideoPlayer() {
    return ValueListenableBuilder(
      valueListenable: flickManager.flickVideoManager!.videoPlayerController!,
      builder: (context, VideoPlayerValue value, child) {
        if (value.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, color: Colors.red, size: Sizes.p48),
                gapH12,
                Text(
                  'Nie udało się załadować filmu.'.hardcoded,
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        }

        // Standardowy odtwarzacz wideo z fallbackiem ładowania
        return FlickVideoPlayer(
          systemUIOverlayFullscreen: const [
            SystemUiOverlay.bottom,
            SystemUiOverlay.top,
          ],
          systemUIOverlay: const [
            SystemUiOverlay.bottom,
          ],
          flickVideoWithControlsFullscreen: const SizedBox(),
          flickManager: flickManager,
          flickVideoWithControls: FlickVideoWithControls(
            controls: const FlickPortraitControls(), // Domyślne kontrolki
            playerLoadingFallback: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.zero,
                color: Colors.black,
              ),
              width: double.infinity,
              height: double.infinity,
            ).animate(
              onPlay: (controller) {
                controller.repeat();
              },
            ).shimmer(
              angle: 15,
              stops: const [0.0, 0.5, 1.0],
              colors: [
                Colors.black,
                Colors.grey[900]!,
                Colors.black,
              ],
              duration: const Duration(seconds: 2),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImage() {
    return CashedImage(
      imageUrl: widget.reel.imageUrls.large.url,
      width: MediaQuery.of(context).size.width.toInt(),
      height: MediaQuery.of(context).size.height.toInt(),
    );
  }
}
