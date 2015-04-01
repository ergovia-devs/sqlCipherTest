# sqlCipherTest
Test for crashing the Cordova-sqlcipher-adaptor

# prerequisites
cordova > 3.0

# installing the test
run installApp.sh

# running on Android
run runAndroid.sh 


# behaviour
I am testing on a NEXUS 7. The test opens a lot of transactions with inserts and updates. Data consists of long strings (base64 images) and numbers. The two different tests differ in the amount of circles.

Touching on the doTimeout Button results in an

```
04-01 11:01:31.730: E/AndroidRuntime(6375): FATAL EXCEPTION: FinalizerWatchdogDaemon
04-01 11:01:31.730: E/AndroidRuntime(6375): Process: de.ergovia.CrashApp, PID: 6375
04-01 11:01:31.730: E/AndroidRuntime(6375): java.util.concurrent.TimeoutException: net.sqlcipher.database.SQLiteCompiledSql.finalize() timed out after 10 seconds
04-01 11:01:31.730: E/AndroidRuntime(6375): 	at java.lang.Object.wait(Native Method)
04-01 11:01:31.730: E/AndroidRuntime(6375): 	at java.lang.Thread.parkFor(Thread.java:1220)
04-01 11:01:31.730: E/AndroidRuntime(6375): 	at sun.misc.Unsafe.park(Unsafe.java:299)
04-01 11:01:31.730: E/AndroidRuntime(6375): 	at java.util.concurrent.locks.LockSupport.park(LockSupport.java:157)
04-01 11:01:31.730: E/AndroidRuntime(6375): 	at java.util.concurrent.locks.AbstractQueuedSynchronizer.parkAndCheckInterrupt(AbstractQueuedSynchronizer.java:813)
04-01 11:01:31.730: E/AndroidRuntime(6375): 	at java.util.concurrent.locks.AbstractQueuedSynchronizer.acquireQueued(AbstractQueuedSynchronizer.java:846)
04-01 11:01:31.730: E/AndroidRuntime(6375): 	at java.util.concurrent.locks.AbstractQueuedSynchronizer.acquire(AbstractQueuedSynchronizer.java:1175)
04-01 11:01:31.730: E/AndroidRuntime(6375): 	at java.util.concurrent.locks.ReentrantLock$FairSync.lock(ReentrantLock.java:195)
04-01 11:01:31.730: E/AndroidRuntime(6375): 	at java.util.concurrent.locks.ReentrantLock.lock(ReentrantLock.java:256)
04-01 11:01:31.730: E/AndroidRuntime(6375): 	at net.sqlcipher.database.SQLiteDatabase.lock(SQLiteDatabase.java:435)
04-01 11:01:31.730: E/AndroidRuntime(6375): 	at net.sqlcipher.database.SQLiteCompiledSql.releaseSqlStatement(SQLiteCompiledSql.java:106)
04-01 11:01:31.730: E/AndroidRuntime(6375): 	at net.sqlcipher.database.SQLiteCompiledSql.finalize(SQLiteCompiledSql.java:152)
04-01 11:01:31.730: E/AndroidRuntime(6375): 	at java.lang.Daemons$FinalizerDaemon.doFinalize(Daemons.java:190)
04-01 11:01:31.730: E/AndroidRuntime(6375): 	at java.lang.Daemons$FinalizerDaemon.run(Daemons.java:173)
04-01 11:01:31.730: E/AndroidRuntime(6375): 	at java.lang.Thread.run(Thread.java:818)
04-01 11:01:31.736: W/ActivityManager(550):   Force finishing activity de.ergovia.CrashApp/.CordovaApp
```

Touching on the Tombstone Button results in an

```
04-01 11:07:04.178: E/chromium(7401): ### WebView Version 40 (1808730-arm) (code 423501)
04-01 11:07:04.178: A/libc(7401): Fatal signal 11 (SIGSEGV), code 1, fault addr 0x0 in tid 7439 (JavaBridge)
04-01 11:07:04.241: I/DEBUG(181): *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***
04-01 11:07:04.241: I/DEBUG(181): Build fingerprint: 'google/razor/flo:5.0.2/LRX22G/1649326:user/release-keys'
04-01 11:07:04.241: I/DEBUG(181): Revision: '0'
04-01 11:07:04.241: I/DEBUG(181): ABI: 'arm'
04-01 11:07:04.241: I/DEBUG(181): pid: 7401, tid: 7439, name: JavaBridge  >>> de.ergovia.CrashApp <<<
04-01 11:07:04.241: I/DEBUG(181): signal 11 (SIGSEGV), code 1 (SEGV_MAPERR), fault addr 0x0
04-01 11:07:04.282: I/DEBUG(181):     r0 00000000  r1 02f7d7ce  r2 00000001  r3 02f7d7ce
04-01 11:07:04.282: I/DEBUG(181):     r4 017bebe5  r5 65300001  r6 a23a2490  r7 0000005b
04-01 11:07:04.282: I/DEBUG(181):     r8 ac683120  r9 a23a258c  sl a23a2578  fp a23a2500
04-01 11:07:04.282: I/DEBUG(181):     ip b6f94710  sp a23a2450  lr b6f74a5d  pc a57a6314  cpsr 200f0030
04-01 11:07:04.283: I/DEBUG(181): backtrace:
04-01 11:07:04.283: I/DEBUG(181):     #00 pc 002a6314  /data/app/com.google.android.webview-1/lib/arm/libwebviewchromium.so
04-01 11:07:04.283: I/DEBUG(181):     #01 pc 00282bf9  /data/app/com.google.android.webview-1/lib/arm/libwebviewchromium.so
04-01 11:07:04.283: I/DEBUG(181):     #02 pc 005774cf  /data/app/com.google.android.webview-1/lib/arm/libwebviewchromium.so
04-01 11:07:04.283: I/DEBUG(181):     #03 pc 00576e21  /data/app/com.google.android.webview-1/lib/arm/libwebviewchromium.so
04-01 11:07:04.284: I/DEBUG(181):     #04 pc 00576069  /data/app/com.google.android.webview-1/lib/arm/libwebviewchromium.so
04-01 11:07:04.284: I/DEBUG(181):     #05 pc 005763ff  /data/app/com.google.android.webview-1/lib/arm/libwebviewchromium.so
04-01 11:07:04.284: I/DEBUG(181):     #06 pc 004dc4fd  /data/app/com.google.android.webview-1/lib/arm/libwebviewchromium.so
04-01 11:07:04.284: I/DEBUG(181):     #07 pc 004dc4bd  /data/app/com.google.android.webview-1/lib/arm/libwebviewchromium.so
04-01 11:07:04.284: I/DEBUG(181):     #08 pc 002b5445  /data/app/com.google.android.webview-1/lib/arm/libwebviewchromium.so
04-01 11:07:04.284: I/DEBUG(181):     #09 pc 00297201  /data/app/com.google.android.webview-1/lib/arm/libwebviewchromium.so
04-01 11:07:04.284: I/DEBUG(181):     #10 pc 00298509  /data/app/com.google.android.webview-1/lib/arm/libwebviewchromium.so
04-01 11:07:04.285: I/DEBUG(181):     #11 pc 002988e3  /data/app/com.google.android.webview-1/lib/arm/libwebviewchromium.so
04-01 11:07:04.285: I/DEBUG(181):     #12 pc 002b031f  /data/app/com.google.android.webview-1/lib/arm/libwebviewchromium.so (Java_com_android_org_chromium_base_SystemMessageHandler_nativeDoRunLoopOnce+22)
04-01 11:07:04.285: I/DEBUG(181):     #13 pc 0001ad17  /data/dalvik-cache/arm/data@app@com.google.android.webview-1@base.apk@classes.dex
04-01 11:07:05.829: I/DEBUG(181): Tombstone written to: /data/tombstones/tombstone_05
04-01 11:07:05.849: I/BootReceiver(550): Copying /data/tombstones/tombstone_05 to DropBox (SYSTEM_TOMBSTONE)
04-01 11:07:05.853: E/SharedPreferencesImpl(550): Couldn't create directory for SharedPreferences file shared_prefs/log_files.xml
04-01 11:07:05.884: W/ActivityManager(550):   Force finishing activity de.ergovia.CrashApp/.CordovaApp
04-01 11:07:06.063: I/Adreno-EGL(550): <qeglDrvAPI_eglInitialize:410>: QUALCOMM Build: 10/28/14, c33033c, Ia6306ec328
04-01 11:07:06.063: I/OpenGLRenderer(550): Initialized EGL, version 1.4
04-01 11:07:06.096: I/WindowState(550): WIN DEATH: Window{1805309d u0 de.ergovia.CrashApp/de.ergovia.CrashApp.CordovaApp}
04-01 11:07:06.305: E/libprocessgroup(550): failed to kill 1 processes for processgroup 7401
04-01 11:07:06.305: I/ActivityManager(550): Process de.ergovia.CrashApp (pid 7401) has died
04-01 11:07:06.398: I/Zygote(195): Process 7401 exited due to signal (11)
```