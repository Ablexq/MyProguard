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