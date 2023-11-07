package com.example.visioneducation

//import com.mob.resul.reandroidsdk.AppConstants

import android.content.Context
import android.graphics.BitmapFactory
import android.os.Bundle
import android.util.Base64
import androidx.annotation.NonNull
import io.flutter.Log
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import ioo.mob.resuu.reandroidsdk.AppConstants
import ioo.mob.resuu.reandroidsdk.*


class MainActivity: FlutterFragmentActivity() {
    private var context: Context? = null
    private val CHANNEL = "samples.flutter.dev"
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "passScreenshotData" -> {
                    var data:String =call.arguments.toString()
                   AppConstants.hybridScreenShot  = data
                    val decodedBytes: ByteArray = Base64.decode(data, Base64.DEFAULT)
                    val bitmap = BitmapFactory.decodeByteArray(decodedBytes, 0, decodedBytes.size)

                    Log.e("ScreenshotData", "$data")
                }
                else -> {
                    if (result != null) {
                        result.notImplemented()
                    }
                }
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        context=applicationContext
        ReAndroidSDK.getInstance(this)
    }





}
