import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ShowTrailerWidget extends StatefulWidget {
  final String youtubeKey;
  const ShowTrailerWidget({
    Key? key,
    required this.youtubeKey,
  }) : super(key: key);

  @override
  _ShowTrailerWidgetState createState() => _ShowTrailerWidgetState();
}

class _ShowTrailerWidgetState extends State<ShowTrailerWidget> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.youtubeKey,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final player = YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      //   controlsTimeOut: const Duration(seconds: 10),
    );
    return YoutubePlayerBuilder(
      player: player,
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Trailer'),
          ),
          body: Center(
            child: player,
          ),
        );
      },
    );
  }
}
