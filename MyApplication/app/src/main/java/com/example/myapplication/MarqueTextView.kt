package com.example.myapplication

import android.content.Context
import android.text.TextUtils
import android.util.AttributeSet

class MarqueTextView @JvmOverloads constructor(context: Context, attrs: AttributeSet? = null) :
    androidx.appcompat.widget.AppCompatTextView(context, attrs) {

    init {
        marqueeRepeatLimit = -1
        ellipsize = TextUtils.TruncateAt.MARQUEE
        setSingleLine()

    }

    override fun isFocused(): Boolean {
        return true
    }
}