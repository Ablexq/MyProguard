##################################################################
# ShortcutBadger
# https://github.com/leolin310148/ShortcutBadger/blob/master/ShortcutBadger/proguard-rules.pro
##################################################################

#https://github.com/leolin310148/ShortcutBadger/issues/46
-keep class me.leolin.shortcutbadger.impl.** { <init>(...); }
