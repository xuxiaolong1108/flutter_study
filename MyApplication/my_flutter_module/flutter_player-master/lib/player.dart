import 'dart:async';
import 'dart:io';

import 'package:fijkplayer/fijkplayer.dart';

class Player extends FijkPlayer {
  static const asset_url_suffix = "asset:///";
  static const cache_switch = 'ijkio:cache:ffio:';

  static String _cachePath = '/storage/emulated/0/Android/data/com.example.mc/files';
  bool enableCache = true;

  static void setCachePath(String path) {
    _cachePath = path;
  }

  @override
  Future<void> setDataSource(String path, {bool autoPlay = false, bool showCover = false}) async {
    var videoPath = getVideoCachePath(path, _cachePath);

    // 三级缓存判断
    if (File(videoPath).existsSync()) {
      // 如果二级缓存存在，直接用本地保存的视频文件播放
      path = videoPath;
      print('MOOC- play cache video: $path');
    } else if (enableCache) {
      // 走三级缓存，并添加到二级缓存——本地磁盘中
      // 设置播放器缓存的步骤：
      // 1、增加视频path前缀
      // path = '$cache_switch$path';
      // 2、通过setOption设置cache_file_path
      setOption(FijkOption.formatCategory, 'cache_file_path', videoPath);
      print('MOOC- play http with cache: $cache_switch$path');
    } else {
      print('MOOC- play http: $path');
    }
    super.setDataSource(path, autoPlay: autoPlay, showCover: showCover);
  }

  void setCommonDataSource(
    String url, {
    SourceType type = SourceType.net,
    bool autoPlay = false,
    bool showCover = false,
  }) {
    if (type == SourceType.asset && !url.startsWith(asset_url_suffix)) {
      url = asset_url_suffix + url;
    }
    setDataSource(url, autoPlay: autoPlay, showCover: showCover);
  }

  String getVideoCachePath(String url, String cachePath) {
    Uri uri = Uri.parse(url);
    String name = uri.pathSegments.last;
    var path = '$cachePath/$name';
    print('MOOC- get video Path: $path');

    return path;
  }
}

enum SourceType { net, asset }
