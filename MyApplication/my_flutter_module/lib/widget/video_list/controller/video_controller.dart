import 'dart:convert';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/video_model.dart';

abstract class VideoController {
  List<VideoModel>? dataList = null;

  /// 针对不同的类型视频，采用不同的key存储
  String get spKey;

  /// 返回不同类型的视频内容
  String get videoData;

  int get count => Random().nextInt(1000);

  Future<void> init() async {
    // 首先判断一级缓存——即内存中是否有数据
    print('MOOC- init video controller');
    if (dataList == null) {
      print('MOOC- model is null');
      // 如果没有，则从二级/三级缓存查找
      dataList = await fetchVideoData();

      if (dataList == null || dataList!.isEmpty) {
        dataList = [];
        dataList?.add(VideoModel(
            "https://img2.baidu.com/it/u=3132790108,220936211&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=708",
            "https://v-cdn.zjol.com.cn/280443.mp4",
            55));
        dataList?.add(VideoModel(
            "https://img2.baidu.com/it/u=2265918604,2322180014&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=929",
            "https://v-cdn.zjol.com.cn/276982.mp4",
            55));
        dataList?.add(VideoModel(
            "https://img2.baidu.com/it/u=4196167393,3183488830&fm=253&fmt=auto&app=138&f=JPEG?w=400&h=600",
            "https://v-cdn.zjol.com.cn/276984.mp4",
            55));
        dataList?.add(VideoModel(
            "https://img1.baidu.com/it/u=3794929526,4224188366&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=750",
            "https://v-cdn.zjol.com.cn/276985.mp4",
            55));
        dataList?.add(VideoModel(
            "https://img2.baidu.com/it/u=2932350209,1984410416&fm=253&fmt=auto?w=360&h=600",
            "http://vfx.mtime.cn/Video/2019/03/21/mp4/190321153853126488.mp4",
            55));
        dataList?.add(VideoModel(
            "https://img1.baidu.com/it/u=2396244364,783218847&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=692",
            "http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4",
            55));
        dataList?.add(VideoModel(
            "https://img1.baidu.com/it/u=2396244364,783218847&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=692",
            "http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4",
            55));
        dataList?.add(VideoModel(
            "https://img1.baidu.com/it/u=2396244364,783218847&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=692",
            "http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4",
            55));
        dataList?.add(VideoModel(
            "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F64995678%2Fa1047a1f3249469cb121280f53a96765.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvNjQ5OTU2NzgvYTEwNDdhMWYzMjQ5NDY5Y2IxMjEyODBmNTNhOTY3NjUuanBn%2Fsign%2F6f3bcae15115db6d1b9c6357f3df40a2.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1710660377&t=5f4ebf5d102a3ce7f8ddad0f9850f0a1",
            "http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4",
            55));
        dataList?.add(VideoModel(
            "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F64995678%2Fa1047a1f3249469cb121280f53a96765.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvNjQ5OTU2NzgvYTEwNDdhMWYzMjQ5NDY5Y2IxMjEyODBmNTNhOTY3NjUuanBn%2Fsign%2F6f3bcae15115db6d1b9c6357f3df40a2.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1710660377&t=5f4ebf5d102a3ce7f8ddad0f9850f0a1",
            "http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4",
            55));
        dataList?.add(VideoModel(
            "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F64995678%2Fa1047a1f3249469cb121280f53a96765.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvNjQ5OTU2NzgvYTEwNDdhMWYzMjQ5NDY5Y2IxMjEyODBmNTNhOTY3NjUuanBn%2Fsign%2F6f3bcae15115db6d1b9c6357f3df40a2.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1710660377&t=5f4ebf5d102a3ce7f8ddad0f9850f0a1",
            "http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4",
            55));
        dataList?.add(VideoModel(
            "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F64995678%2Fa1047a1f3249469cb121280f53a96765.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvNjQ5OTU2NzgvYTEwNDdhMWYzMjQ5NDY5Y2IxMjEyODBmNTNhOTY3NjUuanBn%2Fsign%2F6f3bcae15115db6d1b9c6357f3df40a2.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1710660377&t=5f4ebf5d102a3ce7f8ddad0f9850f0a1",
            "http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4",
            55));
        dataList?.add(VideoModel(
            "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F64995678%2Fa1047a1f3249469cb121280f53a96765.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvNjQ5OTU2NzgvYTEwNDdhMWYzMjQ5NDY5Y2IxMjEyODBmNTNhOTY3NjUuanBn%2Fsign%2F6f3bcae15115db6d1b9c6357f3df40a2.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1710660377&t=5f4ebf5d102a3ce7f8ddad0f9850f0a1",
            "http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4",
            55));
        dataList?.add(VideoModel(
            "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F64995678%2Fa1047a1f3249469cb121280f53a96765.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvNjQ5OTU2NzgvYTEwNDdhMWYzMjQ5NDY5Y2IxMjEyODBmNTNhOTY3NjUuanBn%2Fsign%2F6f3bcae15115db6d1b9c6357f3df40a2.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1710660377&t=5f4ebf5d102a3ce7f8ddad0f9850f0a1",
            "http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4",
            55));
        dataList?.add(VideoModel(
            "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F64995678%2Fa1047a1f3249469cb121280f53a96765.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvNjQ5OTU2NzgvYTEwNDdhMWYzMjQ5NDY5Y2IxMjEyODBmNTNhOTY3NjUuanBn%2Fsign%2F6f3bcae15115db6d1b9c6357f3df40a2.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1710660377&t=5f4ebf5d102a3ce7f8ddad0f9850f0a1",
            "http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4",
            55));
        dataList?.add(VideoModel(
            "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F64995678%2Fa1047a1f3249469cb121280f53a96765.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvNjQ5OTU2NzgvYTEwNDdhMWYzMjQ5NDY5Y2IxMjEyODBmNTNhOTY3NjUuanBn%2Fsign%2F6f3bcae15115db6d1b9c6357f3df40a2.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1710660377&t=5f4ebf5d102a3ce7f8ddad0f9850f0a1",
            "http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4",
            55));
      }
    }
  }

  // 缺点：
  // 1、需要针对json的每个字段创建get方法，一旦字段多了会非常繁琐
  // 2、需要保证map的字段和json的字段完全一致， 容易出错

  // 从服务端拉取视频Json字符串类型表示的视频数据
  Future<List<VideoModel>> fetchVideoData() async {
    return [];
  }
}
