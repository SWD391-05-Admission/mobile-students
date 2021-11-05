import 'package:flutter/material.dart';
import 'package:mobile_customer/models/talkshow.dart';
import 'package:mobile_customer/widgets/video_item.dart';
import 'package:video_player/video_player.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen();
  static const routesName = '/save';

  @override
  _SaveScreenState createState() => _SaveScreenState();
}

PageController _pageControllerCongDong;

List<Talkshow> listTalkshow = [];

class _SaveScreenState extends State<SaveScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  List listVideo = [
    'assets/videos/video1.mp4',
    'assets/videos/video2.mp4',
    'assets/videos/video3.mp4',
    'assets/videos/video4.mp4',
    'assets/videos/video5.mp4',
  ];
  bool isPlay = true;

  @override
  void initState() {
    _pageControllerCongDong = PageController(
      viewportFraction: 1,
    );
    _controller = VideoPlayerController.asset(
      listVideo[0],
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageControllerCongDong.dispose();
    super.dispose();
  }

  bool isCongDong = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: _pageControllerCongDong,
        itemCount: listVideo.length,
        itemBuilder: (context, index) {
          _controller = VideoPlayerController.asset(
            listVideo[index],
          );
          // _initializeVideoPlayerFuture = _controller.initialize();
          return VideoItems(
            // videoPlayerController: VideoPlayerController.asset(
            //   listVideo[index],
            // ),
            videoPlayerController: _controller,
            looping: true,
            autoplay: true,
          );
        },
        onPageChanged: (index) {},
      ),
    );
  }
}
