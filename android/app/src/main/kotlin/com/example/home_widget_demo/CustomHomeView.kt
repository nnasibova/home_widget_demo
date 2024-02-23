package com.example.home_widget_demo

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.widget.RemoteViews
import android.appwidget.AppWidgetProvider
import android.view.View
import android.os.Build
import es.antonborri.home_widget.HomeWidgetPlugin


class CustomHomeView : AppWidgetProvider() {

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,

    ) {
        for (appWidgetId in appWidgetIds) {
            val widgetData = HomeWidgetPlugin.getData(context)
            val views = RemoteViews(context.packageName, R.layout.widget_layout).apply {

                val timerValue = widgetData.getString("timerValue", null)
                setTextViewText(R.id.timerTextView, timerValue ?: "No timer set")
            }
            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}
