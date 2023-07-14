// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DisplayPage extends StatefulWidget {
  final bool isVideo;
  final String url;
  final String title;
  const DisplayPage({
    Key? key,
    required this.isVideo,
    required this.url,
    required this.title,
  }) : super(key: key);

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  VideoPlayerController? _controller;
  @override
  void initState() {
    super.initState();
    if (widget.isVideo) {
      print("videoUrl = ${widget.url}");
      _controller = VideoPlayerController.network(widget.url)
        ..initialize().then((_) {
          _controller!.setLooping(true);
          _controller!.play();
          setState(() {});
        });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        body: Hero(
          tag: widget.url,
          child: GestureDetector(
            onTap: () {
              if (_controller == null) return;
              setState(() {
                _controller!.value.isPlaying
                    ? _controller!.pause()
                    : _controller!.play();
              });
            },
            child: Center(
              child: widget.isVideo
                  ? _controller!.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller!.value.aspectRatio,
                          child: VideoPlayer(_controller!),
                        )
                      : Container()
                  : Image(image: NetworkImage(widget.url), fit: BoxFit.contain),
            ),
          ),
        ));
  }
}
