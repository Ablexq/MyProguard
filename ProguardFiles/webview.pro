
#######################################################################
# webview
#######################################################################
-keepclassmembers class fqcn.of.javascript.interface.for.Webview {
   public *;
}
-keepclassmembers class * extends android.webkit.WebViewClient {
    public void *(android.webkit.WebView, java.lang.String, android.graphics.Bitmap);
    public boolean *(android.webkit.WebView, java.lang.String);
}
-keepclassmembers class * extends android.webkit.WebViewClient {
    public void *(android.webkit.WebView, jav.lang.String);
}

#---------------------------------与js互相调用的类------------------------

#-keep class 你的类所在的包.** { *; } 保留类名不变，也就是类名不混淆
#-keepclasseswithmembers class 你的类所在的包.父类$子类 { <methods>; } 保留类名和成员名。

# 保留所有注解
-keepattributes *Annotation*
-keepattributes *JavascriptInterface*

# 改成自己的包名，类名和内部类名
#-keepclasseswithmembers class <package>.MainActivity$JSInterface {
#      <methods>;
#}









