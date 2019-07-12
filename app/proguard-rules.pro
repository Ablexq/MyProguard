# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

###################################################################################
###################################################################################

###################################################################
#                   基本不用动区域开始
###################################################################
#---------------------------------基本指令区----------------------------------
# 指定代码的压缩级别
-optimizationpasses 5
# 指定不去忽略非公共库的类成员
-dontskipnonpubliclibraryclassmembers
-printmapping proguardMapping.txt
# 是否使用大小写混合,类名均小写
-dontusemixedcaseclassnames
# 是否混淆第三方jar
-dontskipnonpubliclibraryclasses
# 混淆时是否做预校验,可加快混淆速度
-dontpreverify
# 混淆时是否记录日志
-verbose
# 混淆时所采用的算法
-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*
#-optimizations !code/simplification/cast,!field/*,!class/merging/*

#抛出异常时保留代码行号
-keepattributes SourceFile,LineNumberTable
#泛型，解决出现类型转换错误的问题
-keepattributes Signature
#避免混淆js相关的接口
-keepattributes *JavascriptInterface*
#避免混淆注解类
-dontwarn android.annotation
-keepattributes *Annotation*
#避免混淆内部类
-keepattributes InnerClasses

#---------------------------------默认保留区---------------------------------
#继承activity,application,service,broadcastReceiver,contentprovider....不进行混淆
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.support.multidex.MultiDexApplication
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.preference.Preference
-keep public class * extends android.view.View
-keep public class com.android.vending.licensing.ILicensingService
-keep class android.support.** {*;}


#避免混淆自定义控件类的get/set方法和构造函数
-keep public class * extends android.view.View{
        *** get*();
        void set*(***);
        public <init>(android.content.Context);
        public <init>(android.content.Context, android.util.AttributeSet);
        public <init>(android.content.Context, android.util.AttributeSet,int);
}

# 保持自定义控件类不被混淆
-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

# 保留在Activity中的方法参数是view的方法，
# 这样以来我们在layout中写的onClick就不会被影响
#这个主要是在layout 中写的onclick方法android:onclick="onClick"，不进行混淆
-keepclassmembers class * extends android.app.Activity {
   public void *(android.view.View);
}


#不混淆Serializable和它的实现子类、其成员变量
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# 保留R下面的资源
-keep class **.R$* {
 *;
}

# 对于带有回调函数的onXXEvent、**On*Listener的，不能被混淆
-keepclassmembers class * {
    void *(**On*Event);
    void *(**On*Listener);
}

# 避免混淆枚举类
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# 保持 native 方法不被混淆
-keepclasseswithmembernames class * {
    native <methods>;
}

#不混淆Parcelable和它的实现子类，还有Creator成员变量
-keep class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}

#----------------------------手动启用support keep注解------------------------
-dontskipnonpubliclibraryclassmembers
-printconfiguration
-keep,allowobfuscation @interface android.support.annotation.Keep
-keep @android.support.annotation.Keep class *
-keepclassmembers class * {
    @android.support.annotation.Keep *;
}


#===================================================support

#保持兼容包的类不被混淆
-keep class android.support.** {*;}

# 保留继承的
-keep public class * extends android.support.v4.**
-keep public class * extends android.support.v7.**
-keep public class * extends android.support.annotation.**

#========================================support-v4
#https://stackoverflow.com/questions/18978706/obfuscate-android-support-v7-widget-gridlayout-issue
-dontwarn android.support.v4.**
-keep class android.support.v4.app.** { *; }
-keep interface android.support.v4.app.** { *; }
-keep class android.support.v4.** { *; }

#========================================support-v7
-dontwarn android.support.v7.**
-keep class android.support.v7.internal.** { *; }
-keep interface android.support.v7.internal.** { *; }
-keep class android.support.v7.** { *; }

#=======================================support design
#@link http://stackoverflow.com/a/31028536
-dontwarn android.support.design.**
-keep class android.support.design.** { *; }
-keep interface android.support.design.** { *; }
-keep public class android.support.design.R$* { *; }


#==========================================
#使用GSON、fastjson等框架时，所写的JSON对象类不混淆，否则无法将JSON解析成对应的对象
-keepclassmembers class * {
    public <init>(org.json.JSONObject);
}

###################################################################
#                       基本不用动区域结束
###################################################################

################################################################
# 实体类
################################################################
#修改成你对应的包名
#-keep class [your_pkg].** { *; }
# -keep class 你的实体类所在的包.** { *; }
#避免混淆实体类，修改成你对应的包名,示例：
#-keep class com.xxx.model.request.** { *; }
#-keep class com.xxx.model.response.** { *; }

##################################################################
# bugly
# https://bugly.qq.com/docs/user-guide/instruction-manual-android/?v=20190418140644
##################################################################

-dontwarn com.tencent.bugly.**
-keep public class com.tencent.bugly.**{*;}

##################################################################
# butterknife
# https://github.com/JakeWharton/butterknife/blob/master/butterknife/proguard-rules.txt
##################################################################

-keep public class * implements butterknife.Unbinder { public <init>(**, android.view.View); }
-keep class butterknife.*
-keep class butterknife.** { *; }
-dontwarn butterknife.internal.**
-keep class **$$ViewBinder { *; }
-keepclasseswithmembernames class * { @butterknife.* <fields>;}
-keepclasseswithmembernames class * { @butterknife.* <methods>;}

##################################################################
# eventbus
# http://greenrobot.org/eventbus/documentation/proguard/
##################################################################

-keepattributes *Annotation*
-keepclassmembers class * {
    @org.greenrobot.eventbus.Subscribe <methods>;
}
-keep enum org.greenrobot.eventbus.ThreadMode { *; }

# Only required if you use AsyncExecutor
-keepclassmembers class * extends org.greenrobot.eventbus.util.ThrowableFailureEvent {
    <init>(java.lang.Throwable);
}

#####################################################################
# fastjson
#####################################################################
-keepattributes Signature
-dontwarn com.alibaba.fastjson.**
-keep class com.alibaba.fastjson.**{*; }

##################################################################
# glide
# https://github.com/bumptech/glide
##################################################################

-keep public class * implements com.bumptech.glide.module.GlideModule
-keep public class * extends com.bumptech.glide.module.AppGlideModule
# v4.9.0 注意不同版本ImageHeaderParser$在不同的包
-keep public enum com.bumptech.glide.load.ImageHeaderParser$** {
  **[] $VALUES;
  public *;
}

# for DexGuard only
#-keepresourcexmlelements manifest/application/meta-data@value=GlideModule

#================================================glide
# v3.7.0
#-keep public enum com.bumptech.glide.load.resource.bitmap.ImageHeaderParser$** {
#  **[] $VALUES;
#  public *;
#}

####################################################################
# gson
####################################################################
-keep class com.google.gson.** {*;}
-keep class com.google.**{*;}
-keep class sun.misc.Unsafe { *; }
-keep class com.google.gson.stream.** { *; }
-keep class com.google.gson.examples.android.model.** { *; }

##################################################################
# 去掉所有打印
##################################################################

-assumenosideeffects class android.util.Log {
    public static *** d(...);
    public static *** e(...);
    public static *** i(...);
    public static *** v(...);
    public static *** println(...);
    public static *** w(...);
    public static *** wtf(...);
}
-assumenosideeffects class android.util.Log {
   public static *** d(...);
   public static *** v(...);
}

-assumenosideeffects class android.util.Log {
    public static *** e(...);
    public static *** v(...);
}

-assumenosideeffects class android.util.Log {
    public static *** i(...);
    public static *** v(...);
}

-assumenosideeffects class android.util.Log {
    public static *** w(...);
    public static *** v(...);
}

-assumenosideeffects class java.io.PrintStream {
    public *** println(...);
    public *** print(...);
}

-assumenosideeffects class java.io.PrintStream {
    public void println(%);
    public void print(**);
    public void println(java.lang.String) ;
    public void print(java.lang.String) ;
}
-assumenosideeffects class java.lang.System {
    public void println(%);
    public void print(**);
    public void println(java.lang.String) ;
    public void print(java.lang.String) ;
    public final static InputStream in;
    public final static PrintStream out;
    public final static PrintStream err;
}

###########################################################################
# netty
# https://mvnrepository.com/artifact/io.netty/netty-all
###########################################################################
-keepattributes Signature,InnerClasses
-keepclasseswithmembers class io.netty.** {
    *;
}
-dontwarn io.netty.**
-dontwarn sun.**

# Note: the configuration keeps the entry point 'XXX',
# but not the descriptor class 'XXX'
# 添加这行命令:
-ignorewarnings

########################################################################################
# okhttp3.pro
# https://github.com/square/okhttp/blob/master/okhttp/src/main/resources/META-INF/proguard/okhttp3.pro
########################################################################################

-dontwarn javax.annotation.**
-keepnames class okhttp3.internal.publicsuffix.PublicSuffixDatabase
-dontwarn org.codehaus.mojo.animal_sniffer.*
-dontwarn okhttp3.internal.platform.ConscryptPlatform

-dontwarn com.squareup.okhttp3.**
-keep class com.squareup.okhttp3.** { *;}
-dontwarn okio.**

##################################################################
# okio.pro
# https://github.com/square/okio/blob/master/okio/src/jvmMain/resources/META-INF/proguard/okio.pro
##################################################################

# Animal Sniffer compileOnly dependency to ensure APIs are compatible with older versions of Java.
-dontwarn org.codehaus.mojo.animal_sniffer.*

#
-dontwarn com.squareup.**
-dontwarn okio.**
-keep public class org.codehaus.* { *; }
-keep public class java.nio.* { *; }
# Retrolambda
-dontwarn java.lang.invoke.*

##################################################################
# retrofit2.pro
# https://github.com/square/retrofit/blob/master/retrofit/src/main/resources/META-INF/proguard/retrofit2.pro
##################################################################

-keepattributes Signature, InnerClasses, EnclosingMethod
-keepattributes RuntimeVisibleAnnotations, RuntimeVisibleParameterAnnotations
-keepclassmembers,allowshrinking,allowobfuscation interface * {
    @retrofit2.http.* <methods>;
}
-dontwarn org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement
-dontwarn javax.annotation.**
-dontwarn kotlin.Unit
-dontwarn retrofit2.KotlinExtensions
-dontwarn retrofit2.KotlinExtensions$*
-if interface * { @retrofit2.http.* <methods>; }
-keep,allowobfuscation interface <1>

#
-dontwarn retrofit.**
-keep class retrofit.** { *; }
-keepattributes Signature
-keepattributes Exceptions
-dontwarn okio.**

##################################################################
# ShortcutBadger
# https://github.com/leolin310148/ShortcutBadger/blob/master/ShortcutBadger/proguard-rules.pro
##################################################################

#https://github.com/leolin310148/ShortcutBadger/issues/46
-keep class me.leolin.shortcutbadger.impl.** { <init>(...); }

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

































