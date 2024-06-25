class ServerData {
  // 本地mock数据，实际上是模拟网络数据
  static String fetchDataFromServer() => """[
    {
        "picImage": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F64995678%2Fa1047a1f3249469cb121280f53a96765.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvNjQ5OTU2NzgvYTEwNDdhMWYzMjQ5NDY5Y2IxMjEyODBmNTNhOTY3NjUuanBn%2Fsign%2F6f3bcae15115db6d1b9c6357f3df40a2.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1710660377&t=5f4ebf5d102a3ce7f8ddad0f9850f0a1",
        "url": "http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4",
        "playCount": 88
    },
    {
       "picImage": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F64995678%2Fa1047a1f3249469cb121280f53a96765.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvNjQ5OTU2NzgvYTEwNDdhMWYzMjQ5NDY5Y2IxMjEyODBmNTNhOTY3NjUuanBn%2Fsign%2F6f3bcae15115db6d1b9c6357f3df40a2.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1710660377&t=5f4ebf5d102a3ce7f8ddad0f9850f0a1",
        "url": "http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4",
        "playCount": 88
    },
    {
        "picImage": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F64995678%2Fa1047a1f3249469cb121280f53a96765.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvNjQ5OTU2NzgvYTEwNDdhMWYzMjQ5NDY5Y2IxMjEyODBmNTNhOTY3NjUuanBn%2Fsign%2F6f3bcae15115db6d1b9c6357f3df40a2.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1710660377&t=5f4ebf5d102a3ce7f8ddad0f9850f0a1",
        "url": "http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4",
        "playCount": 88
    },
    {
       "picImage": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F64995678%2Fa1047a1f3249469cb121280f53a96765.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvNjQ5OTU2NzgvYTEwNDdhMWYzMjQ5NDY5Y2IxMjEyODBmNTNhOTY3NjUuanBn%2Fsign%2F6f3bcae15115db6d1b9c6357f3df40a2.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1710660377&t=5f4ebf5d102a3ce7f8ddad0f9850f0a1",
        "url": "http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4",
        "playCount": 88
    },
    {
        "picImage": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F64995678%2Fa1047a1f3249469cb121280f53a96765.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvNjQ5OTU2NzgvYTEwNDdhMWYzMjQ5NDY5Y2IxMjEyODBmNTNhOTY3NjUuanBn%2Fsign%2F6f3bcae15115db6d1b9c6357f3df40a2.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1710660377&t=5f4ebf5d102a3ce7f8ddad0f9850f0a1",
        "url": "http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4",
        "playCount": 88
    },
    {
        "picImage": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F64995678%2Fa1047a1f3249469cb121280f53a96765.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvNjQ5OTU2NzgvYTEwNDdhMWYzMjQ5NDY5Y2IxMjEyODBmNTNhOTY3NjUuanBn%2Fsign%2F6f3bcae15115db6d1b9c6357f3df40a2.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1710660377&t=5f4ebf5d102a3ce7f8ddad0f9850f0a1",
        "url": "http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4",
        "playCount": 88
    },
    {
        "picImage": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F64995678%2Fa1047a1f3249469cb121280f53a96765.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvNjQ5OTU2NzgvYTEwNDdhMWYzMjQ5NDY5Y2IxMjEyODBmNTNhOTY3NjUuanBn%2Fsign%2F6f3bcae15115db6d1b9c6357f3df40a2.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1710660377&t=5f4ebf5d102a3ce7f8ddad0f9850f0a1",
        "url": "http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4",
        "playCount": 88
    },
    {
        "picImage": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F64995678%2Fa1047a1f3249469cb121280f53a96765.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvNjQ5OTU2NzgvYTEwNDdhMWYzMjQ5NDY5Y2IxMjEyODBmNTNhOTY3NjUuanBn%2Fsign%2F6f3bcae15115db6d1b9c6357f3df40a2.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1710660377&t=5f4ebf5d102a3ce7f8ddad0f9850f0a1",
        "url": "http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4",
        "playCount": 88
    },
    {
        "picImage": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F64995678%2Fa1047a1f3249469cb121280f53a96765.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvNjQ5OTU2NzgvYTEwNDdhMWYzMjQ5NDY5Y2IxMjEyODBmNTNhOTY3NjUuanBn%2Fsign%2F6f3bcae15115db6d1b9c6357f3df40a2.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1710660377&t=5f4ebf5d102a3ce7f8ddad0f9850f0a1",
        "url": "http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4",
        "playCount": 88
    }
]""";



}
