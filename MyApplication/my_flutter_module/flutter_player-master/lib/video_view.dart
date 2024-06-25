import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';

import 'player.dart';

class VideoView extends StatefulWidget {
  final Player player;
  final FijkFit fit;

  const VideoView(this.player, {this.fit = FijkFit.contain});

  @override
  State<StatefulWidget> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      child: Stack(children: [
        AbsorbPointer(absorbing: true, child: FijkView(player: widget.player, fit: widget.fit)),
        if (widget.player.state == FijkState.paused)
          Align(
            child: Image.asset('packages/player/assets/play.png', width: 70, height: 70),
            alignment: Alignment.center,
          ),
      ]),
      onTap: onTapVideo,
    ));
  }

  void onTapVideo() {
    print('onTapVideo');
    if (widget.player.state == FijkState.paused) {
      widget.player.start();
    } else {
      widget.player.pause();
    }
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();

    widget.player.release();
  }
}
