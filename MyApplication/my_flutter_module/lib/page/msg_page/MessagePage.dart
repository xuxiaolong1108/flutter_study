import 'package:flutter/material.dart';
import 'package:my_flutter_module/page/msg_page/msg_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MessagePage extends StatefulWidget {
  var test = 0;
  var _test2 = 1;

  MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class InfoModel {
  String name = "";
  bool focus = false;
  String pic = "";
  String info = "";

  InfoModel(this.pic, this.focus, this.name, {this.info = ""});
}

class _MessagePageState extends State<MessagePage> {
  List<InfoModel> tempList = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    tempList.add(InfoModel(
        "https://img1.baidu.com/it/u=3091611925,2031043204&fm=253&fmt=auto&app=138&f=JPEG?w=504&h=500",
        false,
        "徐小龙",
        info: "这是我的个人信息"));
    tempList.add(InfoModel(
        "https://img1.baidu.com/it/u=3091611925,2031043204&fm=253&fmt=auto&app=138&f=JPEG?w=504&h=500",
        false,
        "徐小龙"));
    tempList.add(InfoModel(
        "https://img1.baidu.com/it/u=3091611925,2031043204&fm=253&fmt=auto&app=138&f=JPEG?w=504&h=500",
        false,
        "徐小龙",
        info: "这是我的个人信息"));
    tempList.add(InfoModel(
        "https://img1.baidu.com/it/u=3091611925,2031043204&fm=253&fmt=auto&app=138&f=JPEG?w=504&h=500",
        false,
        "徐小龙"));
    tempList.add(InfoModel(
        "https://img1.baidu.com/it/u=3091611925,2031043204&fm=253&fmt=auto&app=138&f=JPEG?w=504&h=500",
        false,
        "徐小龙",
        info: "这是我的个人信息"));
    tempList.add(InfoModel(
        "https://img1.baidu.com/it/u=3091611925,2031043204&fm=253&fmt=auto&app=138&f=JPEG?w=504&h=500",
        false,
        "徐小龙"));
    tempList.add(InfoModel(
        "https://img1.baidu.com/it/u=3091611925,2031043204&fm=253&fmt=auto&app=138&f=JPEG?w=504&h=500",
        false,
        "徐小龙"));
    tempList.add(InfoModel(
        "https://img1.baidu.com/it/u=3091611925,2031043204&fm=253&fmt=auto&app=138&f=JPEG?w=504&h=500",
        false,
        "徐小龙"));
    tempList.add(InfoModel(
        "https://img1.baidu.com/it/u=3091611925,2031043204&fm=253&fmt=auto&app=138&f=JPEG?w=504&h=500",
        false,
        "徐小龙"));
    tempList.add(InfoModel(
        "https://img1.baidu.com/it/u=3091611925,2031043204&fm=253&fmt=auto&app=138&f=JPEG?w=504&h=500",
        false,
        "徐小龙"));
    tempList.add(InfoModel(
        "https://img1.baidu.com/it/u=3091611925,2031043204&fm=253&fmt=auto&app=138&f=JPEG?w=504&h=500",
        false,
        "徐小龙"));
    tempList.add(InfoModel(
        "https://img1.baidu.com/it/u=3091611925,2031043204&fm=253&fmt=auto&app=138&f=JPEG?w=504&h=500",
        false,
        "徐小龙"));
    tempList.add(InfoModel(
        "https://img1.baidu.com/it/u=3091611925,2031043204&fm=253&fmt=auto&app=138&f=JPEG?w=504&h=500",
        false,
        "徐小龙"));
    tempList.add(InfoModel(
        "https://img1.baidu.com/it/u=3091611925,2031043204&fm=253&fmt=auto&app=138&f=JPEG?w=504&h=500",
        false,
        "徐小龙"));
    tempList.add(InfoModel(
        "https://img1.baidu.com/it/u=3091611925,2031043204&fm=253&fmt=auto&app=138&f=JPEG?w=504&h=500",
        false,
        "徐小龙"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          '消息列表',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: refreshController,
        onRefresh: () {
          Future.delayed(const Duration(seconds: 1), () {
            tempList.clear();
            for (int i = 0; i < 15; i++) {
              tempList.add(InfoModel(
                  "https://img1.baidu.com/it/u=3091611925,2031043204&fm=253&fmt=auto&app=138&f=JPEG?w=504&h=500",
                  false,
                  "徐小龙 刷新后",
                  info: "这是我的个人信息"));
            }
            setState(() {});

            refreshController.refreshCompleted();
          });
        },
        onLoading: () {
          Future.delayed(const Duration(seconds: 1), () {
            for (int i = 0; i < 15; i++) {
              tempList.add(InfoModel(
                  "https://img1.baidu.com/it/u=3091611925,2031043204&fm=253&fmt=auto&app=138&f=JPEG?w=504&h=500",
                  false,
                  "徐小龙 加载后",
                  info: "这是我的个人信息"));
            }
            setState(() {});

            refreshController.loadComplete();
          });
        },
        child: ListView.builder(
          itemCount: tempList.length,
          itemBuilder: (context, index) {
            return Dismissible(
                key: new Key(tempList[index].name),
                onDismissed: (direction) {
                  // tempList.removeAt(index);
                  // setState(() {
                  //
                  // });
                },
                background: Container(
                  decoration: const BoxDecoration(color: Colors.green),
                  alignment: Alignment.centerRight,
                  child: const Text(
                    "删除",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                child: MessageItem(tempList[index]));
          },
        ),
      ),
    );
  }
}
