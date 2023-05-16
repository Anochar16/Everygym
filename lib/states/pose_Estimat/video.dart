import 'dart:io';
import 'package:everygym/utility/style/my_style.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  const VideoView({Key? key}) : super(key: key);

  State<VideoView> createState() => _VideoView();
}

class _VideoView extends State<VideoView> {
  VideoPlayerController? _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _startvideo();
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenW = MediaQuery.of(context).size.width;
    var screenH = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('post'),
        ),
        body: Stack(
          children: [
            myStyle().myBackground(screenW: screenW, screenH: screenH),
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Container(
                          child: Stack(children: [
                    Center(
                      child: _videoPlayerController!.value.isInitialized
                          ? AspectRatio(
                              aspectRatio:
                                  _videoPlayerController!.value.aspectRatio,
                              child: VideoPlayer(_videoPlayerController!),
                            )
                          : Container(),
                    ),
                  ]))),
                ],
              ),
            ]),
          ],
        ));
  }

  _startvideo() {
    _videoPlayerController = VideoPlayerController.asset('images/march.git')
      ..initialize().then((value) {
        setState(() {});
      });
  }
}
