package com.example.myapplication.widget

import android.app.Dialog
import android.content.Context
import android.view.Gravity
import android.view.View.GONE
import android.view.View.VISIBLE
import android.view.WindowManager
import android.widget.TextView
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.myapplication.R

object CommentDialog {
    fun show(context: Context) {
        Dialog(context).apply {
            setContentView(R.layout.comment_dialog)
            findViewById<RecyclerView>(R.id.comment_list).apply {
                layoutManager = LinearLayoutManager(context)
                adapter = CommentAdapter()
            }
            findViewById<RecyclerView>(R.id.like_list).apply {
                layoutManager = LinearLayoutManager(context)
                adapter = LikeAdapter()
            }

            findViewById<TextView>(R.id.comment_count).setOnClickListener {
                findViewById<RecyclerView>(R.id.comment_list).visibility = VISIBLE
                findViewById<RecyclerView>(R.id.like_list).visibility = GONE
            }

            findViewById<TextView>(R.id.like_count).setOnClickListener {
                findViewById<RecyclerView>(R.id.like_list).visibility = VISIBLE
                findViewById<RecyclerView>(R.id.comment_list).visibility = GONE
            }

            window?.attributes = window?.attributes?.apply {
                gravity = Gravity.BOTTOM
                height = 1278
                width = WindowManager.LayoutParams.MATCH_PARENT
            }
            window?.setBackgroundDrawable(null)
            show()
        }
    }
}