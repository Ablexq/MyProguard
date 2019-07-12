
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






