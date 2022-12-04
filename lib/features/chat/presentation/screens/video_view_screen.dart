import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsapp/core/utils/dimensions.dart';

class VideoViewScreen extends StatefulWidget {
  const VideoViewScreen({Key? key, this.path}) : super(key: key);
  final String? path;

  @override
  VideoViewScreenState createState() => VideoViewScreenState();
}

class VideoViewScreenState extends State<VideoViewScreen> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.path!))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              icon: Icon(
                Icons.crop_rotate,
                size: context.iconsSize24 + 3,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.emoji_emotions_outlined,
                size: context.iconsSize24 + 3,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.title,
                size: context.iconsSize24 + 3,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.edit,
                size: context.iconsSize24 + 3,
              ),
              onPressed: () {}),
        ],
      ),
      body: SizedBox(
        width: context.screenWidth,
        height: context.screenHeight,
        child: Stack(
          children: [
            SizedBox(
              width: context.screenWidth,
              height: context.screenHeight - 150,
              child: _controller!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    )
                  : Container(),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black38,
                width: context.screenWidth,
                padding: EdgeInsets.symmetric(
                    vertical: context.height10 / 2,
                    horizontal: context.width15 / 2),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: context.font16 + 1,
                  ),
                  maxLines: 6,
                  minLines: 1,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add Caption....",
                      prefixIcon: Icon(
                        Icons.add_photo_alternate,
                        color: Colors.white,
                        size: context.iconsSize24 + 3,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: context.font16 + 1,
                      ),
                      suffixIcon: CircleAvatar(
                        radius: context.radius30 - 3,
                        backgroundColor: Colors.tealAccent[700],
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: context.iconsSize24 + 3,
                        ),
                      )),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _controller!.value.isPlaying
                        ? _controller!.pause()
                        : _controller!.play();
                  });
                },
                child: CircleAvatar(
                  radius: context.radius30 + 3,
                  backgroundColor: Colors.black38,
                  child: Icon(
                    _controller!.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                    size: context.iconsSize16 * 3 + 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
