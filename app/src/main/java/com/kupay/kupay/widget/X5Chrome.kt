package com.kupay.kupay.widget

import android.annotation.SuppressLint
import android.annotation.TargetApi
import android.app.AlertDialog
import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.net.Uri
import android.os.Build
import android.os.Handler
import android.os.Message
import android.util.AttributeSet
import android.widget.EditText
import android.widget.RelativeLayout
import com.kupay.kupay.R
import com.kupay.kupay.callback.WebViewLoadProgressCallback
import com.kupay.kupay.common.js.JSBridge
import com.kupay.kupay.common.js.JSEnv
import com.kupay.kupay.common.js.JSIntercept
import com.kupay.kupay.intercepter.Interceptor
import com.kupay.kupay.util.Logger
import com.tencent.smtt.export.external.interfaces.JsPromptResult
import com.tencent.smtt.export.external.interfaces.JsResult
import com.tencent.smtt.export.external.interfaces.WebResourceRequest
import com.tencent.smtt.export.external.interfaces.WebResourceResponse
import com.tencent.smtt.sdk.WebChromeClient
import com.tencent.smtt.sdk.WebSettings
import com.tencent.smtt.sdk.WebView
import com.tencent.smtt.sdk.WebViewClient
import java.lang.ref.WeakReference
import java.util.*

/**
 * Created by "iqos_jay@outlook.com" on 2018/6/21.
 * 腾讯 X5Chrome
 */
class X5Chrome @JvmOverloads constructor(private val ctx: Context, attributeSet: AttributeSet? = null) : WebView(ctx, attributeSet) {
    private var connectTimeOut: Int = 0
    private var loadCallback: WebViewLoadProgressCallback? = null
    private val mTimerOutHandler = TimerOutHandler(this)
    private var mTimer: Timer? = null
    private var isShowTimeOut: Boolean = false
    private var downloading: Boolean = false

    init {
        connectTimeOut = Integer.parseInt(resources.getString(R.string.connect_url_time_out_value))
        connectTimeOut = if (connectTimeOut >= MIN_TIME_OUT) connectTimeOut else MIN_TIME_OUT
        this.init()
    }

    /**
     * 初始化
     */
    private fun init() {
        Logger.wtf("Using WebView", "腾讯")
//        this.post {
            initClient(this@X5Chrome)
            initSettings(this@X5Chrome)
//        }
    }

    /**
     * 初始化它的设置
     */
    @SuppressLint("SetJavaScriptEnabled")
    private fun initSettings(x5Chrome: X5Chrome, initLp: Boolean = true) {
        val settings = x5Chrome.settings
        // 桥接接口
        JSEnv.setEnv(JSEnv.WEBVIEW, this)
        val ua = settings.userAgentString
        settings.userAgentString = "$ua YINENG_ANDROID/1.0"
        settings.javaScriptEnabled = true//可以与js交互
        // 设置自适应屏幕，两者合用
        settings.useWideViewPort = true//将图片调整到适合webView的大小
        settings.loadWithOverviewMode = true//缩放至屏幕的大小
        settings.allowFileAccess = true//设置可以访问文件
        settings.setAllowFileAccessFromFileURLs(true)
        settings.setAllowUniversalAccessFromFileURLs(true)
        settings.loadsImagesAutomatically = true//支持自动加载图片
        settings.defaultTextEncodingName = "utf-8"//设置编码格式
        settings.cacheMode = WebSettings.LOAD_DEFAULT//默认 根据cache-control决定是否从网络上取数据。
        settings.domStorageEnabled = true//开启 DOM storage API 功能
        settings.databaseEnabled = true//开启 database storage API 功能
        settings.setAppCacheEnabled(true)//开启 Application Caches 功能
        val cacheDirPath = ctx.filesDir.absolutePath + ctx.resources.getString(R.string.app_name)
        settings.setAppCachePath(cacheDirPath) //设置  Application Caches 缓存目录
        // 缩放操作
        settings.setSupportZoom(true)//支持缩放，默认为true。是下面那个的前提。
        settings.builtInZoomControls = true//设置内置的缩放控件。若为false，则该WebView不可缩放
        settings.displayZoomControls = false//隐藏原生的缩放控件
        settings.setSupportMultipleWindows(true)
        settings.javaScriptCanOpenWindowsAutomatically = true
        settings.setSupportMultipleWindows(true)// 设置允许开启多窗口
        if (initLp) {
            val layoutParams = RelativeLayout.LayoutParams(RelativeLayout.LayoutParams.MATCH_PARENT, RelativeLayout.LayoutParams.MATCH_PARENT)
            x5Chrome.layoutParams = layoutParams
        }
        setWebContentsDebuggingEnabled(true)
    }

    /**
     * 初始化内部
     */
    private fun initClient(x5: X5Chrome) {
        try {
            x5.setWebChromeClient(MyWebChromeClient())
            x5.setWebViewClient(MyWebViewClient())
//            val url = ctx.resources.getString(R.string.init_url)
//            // 需要加上referer，否则有些服务器会拒绝加载页面
//            val extraHeaders = HashMap<String, String>()
//            extraHeaders["Referer"] = url
//            loadUrl(url, extraHeaders)
        } catch (e: Exception) {
            e.printStackTrace()
        }

    }

    /**
     * setter
     *
     * @param downloading download status
     */
    fun setSetDownloadStatus(downloading: Boolean) {
        this.downloading = downloading
    }

    /**
     * Handler:will be used to update UI,must use weak reference,
     * else will leaks.
     */
    private class TimerOutHandler(x5Chrome: X5Chrome) : Handler() {
        private val weak: WeakReference<X5Chrome> = WeakReference(x5Chrome)

        override fun handleMessage(msg: Message) {
            super.handleMessage(msg)
            val x5Chrome = weak.get() ?: return
            when (msg.what) {
                START_CONN -> if (x5Chrome.progress < 100) {
                    x5Chrome.mTimerOutHandler.sendEmptyMessage(CONNECT_TIME_OUT)
                    x5Chrome.mTimer?.cancel()
                    x5Chrome.mTimer?.purge()
                }
                //connect time out
                CONNECT_TIME_OUT -> if (!x5Chrome.isShowTimeOut) {
                    x5Chrome.isShowTimeOut = true
                    x5Chrome.loadCallback?.onLoadTimeOut()
                }
            }
        }
    }

    private inner class MyWebViewClient : WebViewClient() {
        override fun onPageStarted(view: WebView?, url: String?, favicon: Bitmap?) {
            super.onPageStarted(view, url, favicon)
            isShowTimeOut = false
            mTimer?.cancel()
            mTimer?.purge()
            mTimer = Timer()
            val timerTask = object : TimerTask() {
                override fun run() {
                    mTimerOutHandler.sendEmptyMessage(START_CONN)
                }
            }
            mTimer?.schedule(timerTask, connectTimeOut.toLong(), 10)
        }

        override fun onPageFinished(view: WebView?, url: String?) {
            super.onPageFinished(view, url)
            loadCallback?.onLoadFinished()
            mTimer?.cancel()
            mTimer?.purge()
        }

        override fun shouldOverrideUrlLoading(view: WebView?, url: String?): Boolean {
            if (null == url) return false
            if (url.startsWith("http") || url.startsWith("file")) {
                val extraHeaders = HashMap<String, String>()
                extraHeaders["Referer"] = view?.url ?: "" // 需要加上referer，否则有些服务器会拒绝加载页面
                view?.loadUrl(url, extraHeaders)
                return true
            }
            try {
                val intent = Intent(Intent.ACTION_VIEW, Uri.parse(url))
                intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_SINGLE_TOP
                view?.context?.startActivity(intent)
            } catch (e: Exception) {
                // 防止没有安装的情况
                e.printStackTrace()
            }

            return true
        }

        @TargetApi(Build.VERSION_CODES.LOLLIPOP)
        override fun shouldInterceptRequest(view: WebView, request: WebResourceRequest): WebResourceResponse? {
            val interceptor = Interceptor()
            val uri = request.url
            interceptor.setWebview(view)
            val handler = interceptor.GetInterceptHandle(uri)
                    ?: return super.shouldInterceptRequest(view, request)

            var response = handler.handle(interceptor)
                    ?: return super.shouldInterceptRequest(view, request)
            response = response as WebResourceResponse
            val extraHeaders = HashMap<String, String>()
            extraHeaders["Referer"] = uri.toString()
            // 设置一个本地加载标签
            extraHeaders["X-From-Mobile"] = "1"
            response.responseHeaders = extraHeaders
            return response
        }
    }

    private inner class MyWebChromeClient : WebChromeClient() {
        override fun onJsAlert(view: WebView?, url: String?, message: String?, result: JsResult?): Boolean {
            AlertDialog.Builder(ctx)
                    .setTitle("提示")
                    .setMessage(message)
                    .setPositiveButton("确定") { _, _ -> result?.confirm() }
                    .setCancelable(false)
                    .create()
                    .show()
            return true
        }

        override fun onJsPrompt(view: WebView?, url: String?, message: String?, defaultValue: String?, result: JsPromptResult?): Boolean {
            val editText = EditText(ctx)
            AlertDialog.Builder(ctx)
                    .setMessage(message)
                    .setView(editText)
                    .setPositiveButton("确定") { _, _ ->
                        result?.confirm(editText.text.toString())
                        editText.setText("")
                    }
                    .setNegativeButton("取消") { _, _ -> result?.cancel() }
                    .setCancelable(false)
                    .create()
                    .show()
            return true
        }

        override fun onJsConfirm(view: WebView?, url: String?, message: String?, result: JsResult?): Boolean {
            AlertDialog.Builder(ctx)
                    .setMessage(message)
                    .setPositiveButton("确定") { _, _ -> result?.confirm() }
                    .setNegativeButton("取消") { _, _ -> result?.cancel() }
                    .setCancelable(false)
                    .create()
                    .show()
            return true
        }

        override fun onCreateWindow(p0: WebView?, p1: Boolean, p2: Boolean, p3: Message?): Boolean {
            val childView = X5Chrome(ctx)
            sViewRoot[0].addView(childView)
            initClient(childView)
            initSettings(childView)
            // Create dynamically a new view
            val transport = p3?.obj as WebViewTransport
            transport.webView = childView
            p3.sendToTarget()
            return true
        }

        override fun onCloseWindow(window: WebView?) {
            try {
                val root = sViewRoot[0]
                val childCount = root.childCount
                if (childCount > 1) {
                    root.removeViewAt(childCount - 1)
                }
            } catch (e: Exception) {
                e.printStackTrace()
            }
        }

    }

    /**
     * Setter
     *
     * @param loadCallback WebViewLoadProgressCallback impl
     */
    fun setLoadCallback(loadCallback: WebViewLoadProgressCallback) {
        this.loadCallback = loadCallback
    }

    companion object {
        private const val START_CONN = 1//While AndroidWebView start load url,this value will be send to handler.
        private const val CONNECT_TIME_OUT = 2//Have been time out.
        /**
         * The min value of connect time out,you can't set value less than this value.
         */
        private const val MIN_TIME_OUT = 1000
        val sViewRoot = mutableListOf<RelativeLayout>()
    }
}
