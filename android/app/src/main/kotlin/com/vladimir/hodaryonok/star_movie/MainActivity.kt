package com.vladimir.hodaryonok.star_movie

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger, CHANNEL
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                SHARE_MOVIE -> {
                    val message = call.arguments  as String
                    shareText(message)
                    result.notImplemented()
                }
                else -> result.error("UNAVAILABLE", "Platform error", null)
            }
        }
    }

    private fun shareText(message: String) {
        val sendIntent: Intent = Intent().apply {
            action = Intent.ACTION_SEND
            putExtra(Intent.EXTRA_TEXT, message)
            type = "text/plain"
        }
        val sharingIntent = Intent.createChooser(sendIntent, "Movie Sharing")
        startActivity(sharingIntent)
    }

    companion object {
        private const val CHANNEL = "com.vladimir.hodaryonok.star_movie/shareMovie"
        private const val SHARE_MOVIE = "share_movie"
    }
}