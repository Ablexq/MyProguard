####################################################################################
# SmartRefreshLayout
# https://github.com/scwang90/SmartRefreshLayout/blob/release/app/proguard-rules.pro
####################################################################################
-keep class com.github.mmin18.** {*;}

-dontwarn android.support.v8.renderscript.*
-keepclassmembers class android.support.v8.renderscript.RenderScript {
  native *** rsn*(...);
  native *** n*(...);
}

-keep class com.wang.avi.** { *; }
-keep class com.wang.avi.indicators.** { *; }

-keep class com.scwang.refreshlayout.activity.practice.BannerPracticeActivity$Movie {*;}




