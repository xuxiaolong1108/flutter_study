package com.example.myapplication

import android.content.Intent
import android.graphics.Color
import android.os.Bundle
import android.view.View
import android.view.View.GONE
import android.view.View.VISIBLE
import android.widget.Button
import android.widget.ImageButton
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentActivity
import com.example.myapplication.page.FriendFragment
import com.example.myapplication.page.VideoPageFragment

class MainActivity : FragmentActivity() {

    companion object {
        const val ENGINE_ID = "engineID"
    }

    private val homeFragment by lazy {
        VideoPageFragment()
    }
    private val friendFragment by lazy {
        FriendFragment()
    }
    private val messageFragment by lazy {
        FlutterFragmentUtil.createFlutterFragment(this, "message", "/message")
    }
    private val mineFragment by lazy {
        FlutterFragmentUtil.createFlutterFragment(this, "mine", "/mine")
    }
    private val cameraFragment by lazy {
        // 通过懒加载创建Flutter Fragment(Android Flutter容器)
        FlutterFragmentUtil.createFlutterFragment(this, "camera", "/camera")
    }

    private var currentFragment: Fragment = homeFragment

    override fun onCreate(savedInstanceState: Bundle?) {

        window.statusBarColor = Color.TRANSPARENT;
        window.decorView.systemUiVisibility = (window.decorView.systemUiVisibility
                or View.SYSTEM_UI_FLAG_LAYOUT_STABLE or View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN);

        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        supportFragmentManager.beginTransaction().add(R.id.fragment_container, homeFragment)
            .commit()

        findViewById<Button>(R.id.bt_home).setOnClickListener { showPage(it) }
        findViewById<Button>(R.id.bt_friend).setOnClickListener { showPage(it) }
        findViewById<Button>(R.id.bt_message).setOnClickListener { showPage(it) }
        findViewById<Button>(R.id.bt_mine).setOnClickListener { showPage(it) }
        findViewById<ImageButton>(R.id.bt_add).setOnClickListener {
            // 添加至页面中
            supportFragmentManager.beginTransaction().add(R.id.camera_container, cameraFragment)
                .commit()
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        currentFragment.onActivityResult(requestCode, resultCode, data)
    }

    private fun showPage(view: View) {
        when (view.id) {
            R.id.bt_home -> homeFragment
            R.id.bt_friend -> friendFragment
            R.id.bt_message -> messageFragment
            R.id.bt_mine -> mineFragment
            else -> homeFragment
        }.let {
            if (currentFragment == it) {
                return
            }

            findViewById<Button>(R.id.bt_home).setTextColor(getColor(R.color.bottom_button_color))
            findViewById<Button>(R.id.bt_friend).setTextColor(getColor(R.color.bottom_button_color))
            findViewById<Button>(R.id.bt_message).setTextColor(getColor(R.color.bottom_button_color))
            findViewById<Button>(R.id.bt_mine).setTextColor(getColor(R.color.bottom_button_color))
            (view as Button).setTextColor(getColor(R.color.white))

            if (it.isAdded) {
                supportFragmentManager.beginTransaction().hide(currentFragment).show(it).commit()
            } else {
                supportFragmentManager.beginTransaction().hide(currentFragment)
                    .add(R.id.fragment_container, it).commit()
            }
            currentFragment = it
        }
    }

    fun hideBottomButton(hide: Boolean) {
        val visible = if (hide) GONE else VISIBLE
        findViewById<Button>(R.id.bt_home).visibility = visible
        findViewById<Button>(R.id.bt_friend).visibility = visible
        findViewById<ImageButton>(R.id.bt_add).visibility = visible
        findViewById<Button>(R.id.bt_message).visibility = visible
        findViewById<Button>(R.id.bt_mine).visibility = visible
    }

    fun closeCamera() {
        // 移除Flutter容器
        supportFragmentManager.beginTransaction().remove(cameraFragment).commit()
    }
}