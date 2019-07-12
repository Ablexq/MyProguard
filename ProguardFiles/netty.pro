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
