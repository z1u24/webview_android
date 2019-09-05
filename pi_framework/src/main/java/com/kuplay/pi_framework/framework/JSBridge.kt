package com.kuplay.pi_framework.framework

import android.app.Activity
import android.app.ActivityOptions
import android.util.Log
import android.webkit.JavascriptInterface
import com.kuplay.pi_framework.Util.ClassInfo
import com.kuplay.pi_framework.Util.CodeUtil
import com.kuplay.pi_framework.Util.ContainerUtil
import com.kuplay.pi_framework.base.BaseJSModule
import com.kuplay.pi_framework.base.JSExecutable
import com.kuplay.pi_framework.module.WebViewManager
import com.kuplay.pi_framework.webview.AndroidWebView
import com.kuplay.pi_framework.webview.X5Chrome
import com.kuplay.pi_framework.webview.YNWebView
import org.json.JSONArray
import java.util.HashMap

class JSBridge(private val ynWebView: YNWebView, private val webview: Any?) {

    private var currID = 0
    /**
     * 对象映射表，键从1开始递增
     */
    private val objMap = HashMap<Int, Any>()
    /**
     * 类映射表，键是类名
     */
    private val clsMap = HashMap<String, ClassInfo>()
    init {
        val classes = CodeUtil.getAllClassByInterface(JSExecutable::class.java)
        if (!ContainerUtil.isNullOrEmpty(classes)){
            for (clazz in classes) {
                setClass(clazz.simpleName, clazz)
            }
        }

    }

    private fun setClass(className: String, clazz: Class<*>) {
        val info = ClassInfo(clazz)
        clsMap[className] = info
        val ms = clazz.declaredMethods
        for (m in ms) {
            info.methods!![m.name] = m
        }
    }

    //高层调用底层
    @JavascriptInterface
    fun postMessage(className: String, methodName: String, nativeID: Int, listenerID: Int, jsonArray: String){
        Log.d("JSBridge","$className,$methodName,$jsonArray")
        var callBack = { callType: Int, prames: Array<Any> ->
            if (callType == 3){
                throwJS(ynWebView.getEnv(ynWebView.ACTIVITY) as Activity,className,methodName,prames[0] as String)
            }else{
                callJS(ynWebView.getEnv(ynWebView.ACTIVITY) as Activity?, webview, listenerID, callType, prames)
            }
        }
        try {
            var newJsonArray = jsonArray
            if (jsonArray.contains("\\\\")){
                newJsonArray = jsonArray.replace("\\\\","\\\\\\\\")
            }
            val js = JSONArray(newJsonArray)
            val params = arrayOfNulls<Any>(1 + js.length())
            for (i in 0 until params.size) {
                if (i == js.length()){
                    params[i] = callBack
                }
                else {
                    params[i] = js.get(i)
                }
            }
            when (methodName) {
                METHOD_INIT -> {
                    val id = newInstance(className, ynWebView)
                    callJS(ynWebView.getEnv(ynWebView.ACTIVITY) as Activity?, webview, listenerID, BaseJSModule.SUCCESS, arrayOf(id))
                }
                METHOD_CLOSE -> {
                    removeObject(nativeID)
                    callJS(ynWebView.getEnv(ynWebView.ACTIVITY) as Activity?, webview, listenerID, BaseJSModule.SUCCESS, emptyArray())
                }
                else -> call(className, methodName, nativeID, params)

            }
        } catch (e: Exception) {
            Log.d("JSbridge",e.message!!)
            //throwJS(webView, webView.getEnv(webView.ACTIVITY) as Activity, className, methodName, e.message!!)
        }
    }

    fun callJS(activity: Activity?, webview: Any?, listenerId: Int, @BaseJSModule.Companion.StatusCode statusCode: Int, params: Array<Any>) {
        var activity = activity
        var webview = webview
        if (activity == null) {
            activity = ynWebView.getEnv(ynWebView.ACTIVITY) as Activity
        }
        if (webview == null) {
            webview = this.webview
        }
        val func = StringBuilder("window['handle_native_message']($listenerId, $statusCode")
        if (null != params)
            for (o in params) {
                Log.d("callJS","$o")
                if (o is Byte) {
                    val v = o.toInt()
                    func.append(", ").append(v)
                } else if (o is Short) {
                    val v = o.toInt()
                    func.append(", ").append(v)
                } else if (o is Int) {
                    val v = o
                    func.append(", ").append(v)
                } else if (o is Float) {
                    val v = o
                    func.append(", ").append(v)
                } else if (o is Double) {
                    val v = o
                    func.append(", ").append(v)
                } else if (o is Boolean) {
                    val v = o
                    func.append(", ").append(if (v) 1 else 0)
                } else if (o is String) {
                    val s = o as String
                    func.append(String.format(", '%s'", s))
                } else {
                    throwJS(activity, "Android", "CallJS", "Internal Error, CallJS params error!")
                    return
                }
            }
        func.append(")")

        Log.d("JSBridge", "callJS: " + func.toString())
        activity.runOnUiThread(CallJSRunnable(func.toString(),webview))
    }



    fun throwJS(activity: Activity, className: String, methodName: String, message: String) {
        val func = String.format("handle_native_throwerror('%s', '%s', '%s')", className, methodName, message)
        Log.d("JSBridge", "throwJS: $func")
        activity.runOnUiThread(CallJSRunnable(func, webview))
    }

    /**
     * 移除对象
     */
    fun removeObject(id: Int) {
        objMap.remove(id)
    }

    /**
     * 根据ID取对象
     */
    fun getObject(id: Int): Any? {
        return objMap[id]
    }

    /**
     * 添加对象，获得对象的id
     */
    fun addObject(o: Any): Int {
        val id = ++currID
        objMap[id] = o
        return id
    }

    /**
     * 生成对象的实例，返回id
     */
    @Throws(Exception::class)
    fun newInstance(className: String, ynWebView: YNWebView): Int {
        val info = clsMap[className] ?: throw Exception("JSEnv.call class $className do not find")
        val id: Int
        try {
            val c = info.clazz.constructors[0]
            val o = c.newInstance(ynWebView)
            id = addObject(o)
        } catch (e: Exception) {
            e.printStackTrace()
            throw Exception(e)
        }

        return id
    }

    /**
     * 通用调用
     */
    @Throws(Exception::class)
    fun call(className: String, methodName: String, objectID: Int, params: Array<Any?>): Any? {
        var obj: Any? = null
        if (objectID > 0) {
            obj = getObject(objectID)
        }
        val info = clsMap[className] ?: throw Exception("JSEnv.call class $className do not find")

        val m = info.methods!![methodName]
            ?: throw Exception("call method " + methodName + "in class " + className + " do not find")
        var r: Any? = null
        try {
            for (o in params){
                Log.d("call","${obj.toString()},${o.toString()}")
            }

            r = m.invoke(obj, *params)
        } catch (e: Exception) {
            e.printStackTrace()
        }

        return r
    }

    companion object {
        private val METHOD_INIT = "init"//method name->init
        private val METHOD_CLOSE = "close"//method name->close


        fun sendJS(ynWebView: YNWebView, type: String, name: String, params: Array<Any>){
            val func = StringBuilder("window['handle_native_event']('$type', '$name'")
            if (null != params)
                for (o in params) {
                    Log.d("callJS","$o")
                    if (o is Byte) {
                        val v = o.toInt()
                        func.append(", ").append(v)
                    } else if (o is Short) {
                        val v = o.toInt()
                        func.append(", ").append(v)
                    } else if (o is Int) {
                        val v = o
                        func.append(", ").append(v)
                    } else if (o is Float) {
                        val v = o
                        func.append(", ").append(v)
                    } else if (o is Double) {
                        val v = o
                        func.append(", ").append(v)
                    } else if (o is Boolean) {
                        val v = o
                        func.append(", ").append(if (v) 1 else 0)
                    } else if (o is String) {
                        val s = o as String
                        func.append(String.format(", '%s'", s))
                    } else {
                        Log.e("JSBridge", "fail to sendJS with error type")
                        return
                    }
                }
            func.append(")")
            Log.d("JSBridge",func.toString())
            (ynWebView.getEnv(ynWebView.ACTIVITY) as Activity).runOnUiThread(CallJSRunnable(func.toString(),ynWebView.getWeb("")))
        }
    }
}

class CallJSRunnable(private val func: String,private val webview: Any?) : Runnable {
    override fun run() {
        if (YNWebView.isX5){
            (webview as X5Chrome).evaluateJavascript(func, null)
        }else{
            (webview as AndroidWebView).evaluateJavascript(func, null)
        }
    }
}