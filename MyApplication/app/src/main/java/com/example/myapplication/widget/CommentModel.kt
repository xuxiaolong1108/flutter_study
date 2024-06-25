package com.example.myapplication.widget

data class CommentModel(
    var name: String, var content: String, var date: String
)

object ServerData {
    fun fetchData(): List<CommentModel> {
        return listOf(
            CommentModel("超低空", "关键看气质", "2021-2-16"),
            CommentModel("iMooc", "很帅", "2021-2-16"),
            CommentModel("Flutter", "还是我跨平台更帅", "2021-2-19"),
            CommentModel("Android", "原生性能好，稳定", "2021-2-20"),
            CommentModel("Emercy", "只能说，各有千秋吧", "2021-2-20"),
            CommentModel("Google", "都是哥的人，别吵了", "2021-2-22"),
        )
    }
}