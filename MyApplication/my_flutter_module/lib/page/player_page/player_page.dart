import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_module/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:player/player.dart';
import 'package:player/video_view.dart';

import '../../widget/favorite_gesture/favorite_gesture.dart';
import '../../widget/t_image.dart';
import '../../gen/assets.gen.dart';

class PlayerPage extends StatefulWidget {
  final String url;

  const PlayerPage(this.url);

  @override
  State<StatefulWidget> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  String version = 'null';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var player = Player();
    print('video url is :${widget.url}');
    player.setCommonDataSource(widget.url,
        type: SourceType.net, autoPlay: true);
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          bottom: 0,
          child: FavoriteGesture(
              child: GestureDetector(
                  onLongPress: () {
                    // 长按视频，弹出对话框
                    showDialog(
                        context: context,
                        builder: (context) {
                          // 构建Dialog UI
                          return AlertDialog(
                            title: const Text('提示'),
                            content: const Text('确认下载本视频吗？'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'cancel'),
                                  child: const Text('取消')),
                              TextButton(
                                  onPressed: () {
                                    _saveVideo(widget.url);
                                    Navigator.pop(context, 'cancel');
                                  },
                                  child: const Text('确认'))
                            ],
                          );
                        });
                  },
                  child: VideoView(player))),
        ),
        Positioned(
            top: 50,
            right: 50,
            child: GestureDetector(
              onTap: () {
                router.popRoute();
              },
              child: TImage(
                Assets.image.close.path,
                width: 25,
                height: 25,
              ),
            )),
      ],
    );
  }

  _saveVideo(String url) async {
    Uri uri = Uri.parse(url);
    String name = uri.pathSegments.last;
    print('MOOC-save video: $url');

    var dir = await getExternalStorageDirectory();

    String savePath = "${dir?.path}/$name";

    print('MOOC-savePath: $savePath');

    // 开启下载，将url下载到的视频保存到savePath当中
    var result =
        await Dio().download(url, savePath, onReceiveProgress: (count, total) {
      var progress = '${(count / total * 100).toInt()}%';
      print('MOOC- progress: $progress');
    });
    print('MOOC- result: $result');
  }
}
