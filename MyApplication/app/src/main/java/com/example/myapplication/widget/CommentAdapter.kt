package com.example.myapplication.widget

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.myapplication.R

class CommentAdapter : RecyclerView.Adapter<CommentAdapter.CommentHolder>() {

    private val dataList = ServerData.fetchData()

    class CommentHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        var text: TextView = itemView.findViewById(R.id.content)
        var name: TextView = itemView.findViewById(R.id.name)
        var date: TextView = itemView.findViewById(R.id.date)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CommentHolder {
        val view: View =
            LayoutInflater.from(parent.context).inflate(R.layout.comment_item, parent, false)
        return CommentHolder(view)
    }

    override fun onBindViewHolder(holder: CommentHolder, position: Int) {
        dataList[position].apply {
            holder.text.text = content
            holder.name.text = name
            holder.date.text = date
        }
    }

    override fun getItemCount(): Int {
        return dataList.size
    }
}