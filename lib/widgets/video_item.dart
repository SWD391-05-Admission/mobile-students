import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoItems extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final bool autoplay;

  VideoItems({
    @required this.videoPlayerController,
    this.looping,
    this.autoplay,
    Key key,
  }) : super(key: key);

  @override
  _VideoItemsState createState() => _VideoItemsState();
}

class _VideoItemsState extends State<VideoItems> {
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      allowPlaybackSpeedChanging: true,
      // allowFullScreen: true,
      // fullScreenByDefault: true,

      //
      videoPlayerController: widget.videoPlayerController,
      // aspectRatio: 5 / 10.35,
      aspectRatio: 5 / 10.35,
      autoInitialize: true,
      autoPlay: widget.autoplay,
      looping: widget.looping,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Chewie(
          controller: _chewieController,
        ),
        Positioned(
            top: 360,
            left: 384,
            child: Icon(
              Icons.favorite,
              color: Colors.white,
            )),
        Positioned(
            top: 410,
            left: 384,
            child: Icon(
              Icons.message,
              color: Colors.white,
            )),
        Positioned(
            top: 460,
            left: 384,
            child: Icon(
              Icons.share,
              color: Colors.white,
            )),
      ],
    );
  }
}
