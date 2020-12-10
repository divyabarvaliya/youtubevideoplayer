import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VedioPlay extends StatelessWidget {
  final String uri;
  VedioPlay({Key key, this.uri}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: uri,
                  flags: YoutubePlayerFlags(autoPlay: true, mute: false),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
