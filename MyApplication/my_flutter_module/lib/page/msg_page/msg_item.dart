import 'package:flutter/material.dart';
import 'package:my_flutter_module/page/msg_page/MessagePage.dart';

class MessageItem extends StatefulWidget {
  InfoModel model;

  MessageItem(this.model, {super.key});

  @override
  State<MessageItem> createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                widget.model.pic,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.model.name,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              Visibility(
                visible: widget.model.info.isNotEmpty,
                child: Text(
                  widget.model.info,
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ),
            ],
          )),
          Container(
            width: 80,
            height: 80,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    color: widget.model.focus ? Colors.grey : Colors.red,
                    borderRadius: BorderRadius.circular(5)),
                padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                child: InkWell(
                  child: Text(
                    widget.model.focus ? '已关注' : '关注',
                    style: TextStyle(
                      color: widget.model.focus ? Colors.black45 : Colors.white,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      widget.model.focus = !widget.model.focus;
                    });
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
