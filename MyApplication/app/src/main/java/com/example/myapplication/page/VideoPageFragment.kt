package com.example.myapplication.page

import android.graphics.Color
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.fragment.app.Fragment
import androidx.viewpager2.widget.ViewPager2
import com.example.myapplication.R

/**
 * 首页Fragment，首页采用原生编写
 */
class VideoPageFragment : Fragment() {

    private var view: View? = null
    private var fragment: FocusFragment? = null

    companion object {
        const val TAG = "VideoPageFragment"
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?
    ): View? {
        view = inflater.inflate(R.layout.fragment_home_page, container, false)
        return view
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        fragment = FocusFragment.newInstance()
        childFragmentManager.beginTransaction().replace(R.id.fl_video_container,fragment!!).commit()

    }

    override fun onHiddenChanged(hidden: Boolean) {
        super.onHiddenChanged(hidden)
        if (hidden) {
            fragment?.pauseVideo()
        } else {
            fragment?.startVideo()
        }
    }
}