.class public Lcom/android/settings/DeviceInfoSettings;
.super Landroid/preference/PreferenceActivity;
.source "DeviceInfoSettings.java"


# static fields
.field private static final KEY_CONTAINER:Ljava/lang/String; = "container"

.field private static final KEY_CONTRIBUTORS:Ljava/lang/String; = "contributors"

.field private static final KEY_COPYRIGHT:Ljava/lang/String; = "copyright"

.field private static final KEY_LICENSE:Ljava/lang/String; = "license"

.field private static final KEY_SYSTEM_UPDATE_SETTINGS:Ljava/lang/String; = "system_update_settings"

.field private static final KEY_TEAM:Ljava/lang/String; = "team"

.field private static final KEY_TERMS:Ljava/lang/String; = "terms"

.field private static final KEY_UPDATE_SETTING:Ljava/lang/String; = "additional_system_update_settings"

.field private static final PROPERTY_URL_SAFETYLEGAL:Ljava/lang/String; = "ro.url.safetylegal"

.field private static final TAG:Ljava/lang/String; = "DeviceInfoSettings"


# instance fields
.field mHits:[J


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 44
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 57
    const/4 v0, 0x3

    new-array v0, v0, [J

    iput-object v0, p0, Lcom/android/settings/DeviceInfoSettings;->mHits:[J

    return-void
.end method

.method private getCPUInfo()Ljava/lang/String;
    .locals 9

    .prologue
    const/4 v8, 0x1

    .line 261
    const/4 v0, 0x0

    .line 262
    .local v0, info:[Ljava/lang/String;
    const/4 v3, 0x0

    .line 266
    .local v3, reader:Ljava/io/BufferedReader;
    :try_start_0
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    new-instance v6, Ljava/io/FileInputStream;

    const-string v7, "/proc/cpuinfo"

    invoke-direct {v6, v7}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v6, 0x3e8

    invoke-direct {v4, v5, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 269
    .end local v3           #reader:Ljava/io/BufferedReader;
    .local v4, reader:Ljava/io/BufferedReader;
    :try_start_1
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .line 272
    .local v2, line:Ljava/lang/String;
    const-string v5, ":"

    invoke-virtual {v2, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4

    move-result-object v0

    .line 281
    :try_start_2
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 283
    :goto_0
    const/4 v3, 0x0

    .line 286
    .end local v2           #line:Ljava/lang/String;
    .end local v4           #reader:Ljava/io/BufferedReader;
    .restart local v3       #reader:Ljava/io/BufferedReader;
    :goto_1
    aget-object v5, v0, v8

    return-object v5

    .line 274
    :catch_0
    move-exception v5

    move-object v1, v5

    .line 275
    .local v1, io:Ljava/io/IOException;
    :goto_2
    :try_start_3
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 276
    const/4 v5, 0x1

    new-array v0, v5, [Ljava/lang/String;

    .line 277
    const/4 v5, 0x1

    const-string v6, "error"

    aput-object v6, v0, v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 281
    :try_start_4
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 283
    :goto_3
    const/4 v3, 0x0

    .line 284
    goto :goto_1

    .line 281
    .end local v1           #io:Ljava/io/IOException;
    :catchall_0
    move-exception v5

    :goto_4
    :try_start_5
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 283
    :goto_5
    const/4 v3, 0x0

    throw v5

    .line 282
    .end local v3           #reader:Ljava/io/BufferedReader;
    .restart local v2       #line:Ljava/lang/String;
    .restart local v4       #reader:Ljava/io/BufferedReader;
    :catch_1
    move-exception v5

    goto :goto_0

    .end local v2           #line:Ljava/lang/String;
    .end local v4           #reader:Ljava/io/BufferedReader;
    .restart local v1       #io:Ljava/io/IOException;
    .restart local v3       #reader:Ljava/io/BufferedReader;
    :catch_2
    move-exception v5

    goto :goto_3

    .end local v1           #io:Ljava/io/IOException;
    :catch_3
    move-exception v6

    goto :goto_5

    .line 281
    .end local v3           #reader:Ljava/io/BufferedReader;
    .restart local v4       #reader:Ljava/io/BufferedReader;
    :catchall_1
    move-exception v5

    move-object v3, v4

    .end local v4           #reader:Ljava/io/BufferedReader;
    .restart local v3       #reader:Ljava/io/BufferedReader;
    goto :goto_4

    .line 274
    .end local v3           #reader:Ljava/io/BufferedReader;
    .restart local v4       #reader:Ljava/io/BufferedReader;
    :catch_4
    move-exception v5

    move-object v1, v5

    move-object v3, v4

    .end local v4           #reader:Ljava/io/BufferedReader;
    .restart local v3       #reader:Ljava/io/BufferedReader;
    goto :goto_2
.end method

.method private getFormattedKernelVersion()Ljava/lang/String;
    .locals 11

    .prologue
    const/4 v8, 0x4

    const-string v6, "\n"

    const-string v10, "Unavailable"

    const-string v9, "DeviceInfoSettings"

    .line 293
    :try_start_0
    new-instance v5, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/FileReader;

    const-string v7, "/proc/version"

    invoke-direct {v6, v7}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    const/16 v7, 0x100

    invoke-direct {v5, v6, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 295
    .local v5, reader:Ljava/io/BufferedReader;
    :try_start_1
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v4

    .line 297
    .local v4, procVersionStr:Ljava/lang/String;
    :try_start_2
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V

    .line 300
    const-string v0, "\\w+\\s+\\w+\\s+([^\\s]+)\\s+\\(([^\\s@]+(?:@[^\\s.]+)?)[^)]*\\)\\s+\\((?:[^(]*\\([^)]*\\))?[^)]*\\)\\s+([^\\s]+)\\s+(?:PREEMPT\\s+)?(.+)"

    .line 310
    .local v0, PROC_VERSION_REGEX:Ljava/lang/String;
    const-string v6, "\\w+\\s+\\w+\\s+([^\\s]+)\\s+\\(([^\\s@]+(?:@[^\\s.]+)?)[^)]*\\)\\s+\\((?:[^(]*\\([^)]*\\))?[^)]*\\)\\s+([^\\s]+)\\s+(?:PREEMPT\\s+)?(.+)"

    invoke-static {v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    .line 311
    .local v3, p:Ljava/util/regex/Pattern;
    invoke-virtual {v3, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 313
    .local v2, m:Ljava/util/regex/Matcher;
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v6

    if-nez v6, :cond_0

    .line 314
    const-string v6, "DeviceInfoSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Regex did not match on /proc/version: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 315
    const-string v6, "Unavailable"

    move-object v6, v10

    .line 330
    .end local v0           #PROC_VERSION_REGEX:Ljava/lang/String;
    .end local v2           #m:Ljava/util/regex/Matcher;
    .end local v3           #p:Ljava/util/regex/Pattern;
    .end local v4           #procVersionStr:Ljava/lang/String;
    .end local v5           #reader:Ljava/io/BufferedReader;
    :goto_0
    return-object v6

    .line 297
    .restart local v5       #reader:Ljava/io/BufferedReader;
    :catchall_0
    move-exception v6

    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V

    throw v6
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 325
    .end local v5           #reader:Ljava/io/BufferedReader;
    :catch_0
    move-exception v6

    move-object v1, v6

    .line 326
    .local v1, e:Ljava/io/IOException;
    const-string v6, "DeviceInfoSettings"

    const-string v6, "IO Exception when getting kernel version for Device Info screen"

    invoke-static {v9, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 330
    const-string v6, "Unavailable"

    move-object v6, v10

    goto :goto_0

    .line 316
    .end local v1           #e:Ljava/io/IOException;
    .restart local v0       #PROC_VERSION_REGEX:Ljava/lang/String;
    .restart local v2       #m:Ljava/util/regex/Matcher;
    .restart local v3       #p:Ljava/util/regex/Pattern;
    .restart local v4       #procVersionStr:Ljava/lang/String;
    .restart local v5       #reader:Ljava/io/BufferedReader;
    :cond_0
    :try_start_3
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->groupCount()I

    move-result v6

    if-ge v6, v8, :cond_1

    .line 317
    const-string v6, "DeviceInfoSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Regex match on /proc/version only returned "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->groupCount()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " groups"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 319
    const-string v6, "Unavailable"

    move-object v6, v10

    goto :goto_0

    .line 321
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    const/4 v7, 0x1

    invoke-virtual {v2, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/4 v7, 0x2

    invoke-virtual {v2, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/4 v7, 0x3

    invoke-virtual {v2, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/4 v7, 0x4

    invoke-virtual {v2, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v6

    goto :goto_0
.end method

.method private getMemAvail()Ljava/lang/Long;
    .locals 13

    .prologue
    const-string v9, ":"

    const-string v9, " "

    .line 217
    const/4 v0, 0x0

    .line 218
    .local v0, avail:Ljava/lang/Long;
    const/4 v7, 0x0

    .line 222
    .local v7, reader:Ljava/io/BufferedReader;
    :try_start_0
    new-instance v8, Ljava/io/BufferedReader;

    new-instance v9, Ljava/io/InputStreamReader;

    new-instance v10, Ljava/io/FileInputStream;

    const-string v11, "/proc/meminfo"

    invoke-direct {v10, v11}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v9, v10}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v10, 0x3e8

    invoke-direct {v8, v9, v10}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 225
    .end local v7           #reader:Ljava/io/BufferedReader;
    .local v8, reader:Ljava/io/BufferedReader;
    :try_start_1
    invoke-virtual {v8}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 228
    .local v4, line:Ljava/lang/String;
    invoke-virtual {v8}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 229
    const-string v9, ":"

    invoke-virtual {v4, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 231
    .local v3, free:[Ljava/lang/String;
    const/4 v9, 0x1

    aget-object v9, v3, v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    const-string v10, " "

    invoke-virtual {v9, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 234
    .local v6, memFree:[Ljava/lang/String;
    invoke-virtual {v8}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 237
    invoke-virtual {v8}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 238
    const-string v9, ":"

    invoke-virtual {v4, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 240
    .local v1, cached:[Ljava/lang/String;
    const/4 v9, 0x1

    aget-object v9, v1, v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    const-string v10, " "

    invoke-virtual {v9, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 242
    .local v5, memCached:[Ljava/lang/String;
    const/4 v9, 0x0

    aget-object v9, v6, v9

    invoke-static {v9}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v9

    const/4 v11, 0x0

    aget-object v11, v5, v11

    invoke-static {v11}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v11

    add-long/2addr v9, v11

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 243
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    const-wide/16 v11, 0x400

    div-long/2addr v9, v11

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4

    move-result-object v0

    .line 252
    :try_start_2
    invoke-virtual {v8}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 254
    :goto_0
    const/4 v7, 0x0

    .line 257
    .end local v1           #cached:[Ljava/lang/String;
    .end local v3           #free:[Ljava/lang/String;
    .end local v4           #line:Ljava/lang/String;
    .end local v5           #memCached:[Ljava/lang/String;
    .end local v6           #memFree:[Ljava/lang/String;
    .end local v8           #reader:Ljava/io/BufferedReader;
    .restart local v7       #reader:Ljava/io/BufferedReader;
    :goto_1
    return-object v0

    .line 245
    :catch_0
    move-exception v9

    move-object v2, v9

    .line 246
    .local v2, e:Ljava/lang/Exception;
    :goto_2
    :try_start_3
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 248
    const-string v9, "0"

    invoke-static {v9}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v0

    .line 252
    :try_start_4
    invoke-virtual {v7}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 254
    :goto_3
    const/4 v7, 0x0

    .line 255
    goto :goto_1

    .line 252
    .end local v2           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v9

    :goto_4
    :try_start_5
    invoke-virtual {v7}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 254
    :goto_5
    const/4 v7, 0x0

    throw v9

    .line 253
    .end local v7           #reader:Ljava/io/BufferedReader;
    .restart local v1       #cached:[Ljava/lang/String;
    .restart local v3       #free:[Ljava/lang/String;
    .restart local v4       #line:Ljava/lang/String;
    .restart local v5       #memCached:[Ljava/lang/String;
    .restart local v6       #memFree:[Ljava/lang/String;
    .restart local v8       #reader:Ljava/io/BufferedReader;
    :catch_1
    move-exception v9

    goto :goto_0

    .end local v1           #cached:[Ljava/lang/String;
    .end local v3           #free:[Ljava/lang/String;
    .end local v4           #line:Ljava/lang/String;
    .end local v5           #memCached:[Ljava/lang/String;
    .end local v6           #memFree:[Ljava/lang/String;
    .end local v8           #reader:Ljava/io/BufferedReader;
    .restart local v2       #e:Ljava/lang/Exception;
    .restart local v7       #reader:Ljava/io/BufferedReader;
    :catch_2
    move-exception v9

    goto :goto_3

    .end local v2           #e:Ljava/lang/Exception;
    :catch_3
    move-exception v10

    goto :goto_5

    .line 252
    .end local v7           #reader:Ljava/io/BufferedReader;
    .restart local v8       #reader:Ljava/io/BufferedReader;
    :catchall_1
    move-exception v9

    move-object v7, v8

    .end local v8           #reader:Ljava/io/BufferedReader;
    .restart local v7       #reader:Ljava/io/BufferedReader;
    goto :goto_4

    .line 245
    .end local v7           #reader:Ljava/io/BufferedReader;
    .restart local v8       #reader:Ljava/io/BufferedReader;
    :catch_4
    move-exception v9

    move-object v2, v9

    move-object v7, v8

    .end local v8           #reader:Ljava/io/BufferedReader;
    .restart local v7       #reader:Ljava/io/BufferedReader;
    goto :goto_2
.end method

.method private getMemTotal()Ljava/lang/Long;
    .locals 11

    .prologue
    .line 181
    const/4 v6, 0x0

    .line 182
    .local v6, total:Ljava/lang/Long;
    const/4 v4, 0x0

    .line 186
    .local v4, reader:Ljava/io/BufferedReader;
    :try_start_0
    new-instance v5, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/InputStreamReader;

    new-instance v8, Ljava/io/FileInputStream;

    const-string v9, "/proc/meminfo"

    invoke-direct {v8, v9}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v7, v8}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v8, 0x3e8

    invoke-direct {v5, v7, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 189
    .end local v4           #reader:Ljava/io/BufferedReader;
    .local v5, reader:Ljava/io/BufferedReader;
    :try_start_1
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .line 192
    .local v2, line:Ljava/lang/String;
    const-string v7, ":"

    invoke-virtual {v2, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 195
    .local v1, info:[Ljava/lang/String;
    const/4 v7, 0x1

    aget-object v7, v1, v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 198
    .local v3, memTotal:[Ljava/lang/String;
    const/4 v7, 0x0

    aget-object v7, v3, v7

    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    .line 199
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    const-wide/16 v9, 0x400

    div-long/2addr v7, v9

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4

    move-result-object v6

    .line 208
    :try_start_2
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 210
    :goto_0
    const/4 v4, 0x0

    .line 213
    .end local v1           #info:[Ljava/lang/String;
    .end local v2           #line:Ljava/lang/String;
    .end local v3           #memTotal:[Ljava/lang/String;
    .end local v5           #reader:Ljava/io/BufferedReader;
    .restart local v4       #reader:Ljava/io/BufferedReader;
    :goto_1
    return-object v6

    .line 201
    :catch_0
    move-exception v7

    move-object v0, v7

    .line 202
    .local v0, e:Ljava/lang/Exception;
    :goto_2
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 204
    const-string v7, "0"

    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v6

    .line 208
    :try_start_4
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 210
    :goto_3
    const/4 v4, 0x0

    .line 211
    goto :goto_1

    .line 208
    .end local v0           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    :goto_4
    :try_start_5
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 210
    :goto_5
    const/4 v4, 0x0

    throw v7

    .line 209
    .end local v4           #reader:Ljava/io/BufferedReader;
    .restart local v1       #info:[Ljava/lang/String;
    .restart local v2       #line:Ljava/lang/String;
    .restart local v3       #memTotal:[Ljava/lang/String;
    .restart local v5       #reader:Ljava/io/BufferedReader;
    :catch_1
    move-exception v7

    goto :goto_0

    .end local v1           #info:[Ljava/lang/String;
    .end local v2           #line:Ljava/lang/String;
    .end local v3           #memTotal:[Ljava/lang/String;
    .end local v5           #reader:Ljava/io/BufferedReader;
    .restart local v0       #e:Ljava/lang/Exception;
    .restart local v4       #reader:Ljava/io/BufferedReader;
    :catch_2
    move-exception v7

    goto :goto_3

    .end local v0           #e:Ljava/lang/Exception;
    :catch_3
    move-exception v8

    goto :goto_5

    .line 208
    .end local v4           #reader:Ljava/io/BufferedReader;
    .restart local v5       #reader:Ljava/io/BufferedReader;
    :catchall_1
    move-exception v7

    move-object v4, v5

    .end local v5           #reader:Ljava/io/BufferedReader;
    .restart local v4       #reader:Ljava/io/BufferedReader;
    goto :goto_4

    .line 201
    .end local v4           #reader:Ljava/io/BufferedReader;
    .restart local v5       #reader:Ljava/io/BufferedReader;
    :catch_4
    move-exception v7

    move-object v0, v7

    move-object v4, v5

    .end local v5           #reader:Ljava/io/BufferedReader;
    .restart local v4       #reader:Ljava/io/BufferedReader;
    goto :goto_2
.end method

.method private removePreferenceIfPropertyMissing(Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .parameter "preferenceGroup"
    .parameter "preference"
    .parameter "property"

    .prologue
    .line 149
    invoke-static {p3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 153
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/android/settings/DeviceInfoSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 159
    :cond_0
    :goto_0
    return-void

    .line 154
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 155
    .local v0, e:Ljava/lang/RuntimeException;
    const-string v1, "DeviceInfoSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Property \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' missing and no \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' preference"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private setStringSummary(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .parameter "preference"
    .parameter "value"

    .prologue
    .line 163
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/android/settings/DeviceInfoSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 168
    :goto_0
    return-void

    .line 164
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 165
    .local v0, e:Ljava/lang/RuntimeException;
    invoke-virtual {p0, p1}, Lcom/android/settings/DeviceInfoSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/settings/DeviceInfoSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f080004

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private setValueSummary(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .parameter "preference"
    .parameter "property"

    .prologue
    .line 172
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/android/settings/DeviceInfoSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/settings/DeviceInfoSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f080004

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p2, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 178
    :goto_0
    return-void

    .line 175
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 13
    .parameter "icicle"

    .prologue
    const/4 v10, 0x1

    const-string v12, "mod_version"

    const-string v11, "firmware_version"

    .line 61
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 63
    const v7, 0x7f04000c

    invoke-virtual {p0, v7}, Lcom/android/settings/DeviceInfoSettings;->addPreferencesFromResource(I)V

    .line 66
    invoke-virtual {p0}, Lcom/android/settings/DeviceInfoSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    const-string v8, "default_input_method"

    invoke-static {v7, v8}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 68
    .local v1, currentIme:Ljava/lang/String;
    invoke-static {v1}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object v0

    .line 69
    .local v0, component:Landroid/content/ComponentName;
    new-instance v2, Landroid/content/Intent;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".tutorial"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v2, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 70
    .local v2, imeIntent:Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/android/settings/DeviceInfoSettings;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    .line 71
    .local v5, pm:Landroid/content/pm/PackageManager;
    const/4 v7, 0x0

    invoke-virtual {v5, v2, v7}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v6

    .line 72
    .local v6, tutorials:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    if-eqz v6, :cond_0

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 73
    :cond_0
    invoke-virtual {p0}, Lcom/android/settings/DeviceInfoSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v7

    const-string v8, "system_tutorial"

    invoke-virtual {p0, v8}, Lcom/android/settings/DeviceInfoSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 76
    :cond_1
    const-string v7, "device_cpu"

    invoke-direct {p0}, Lcom/android/settings/DeviceInfoSettings;->getCPUInfo()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v7, v8}, Lcom/android/settings/DeviceInfoSettings;->setStringSummary(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    const-string v7, "device_memory"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Lcom/android/settings/DeviceInfoSettings;->getMemAvail()Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Long;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " MB / "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-direct {p0}, Lcom/android/settings/DeviceInfoSettings;->getMemTotal()Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Long;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " MB"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v7, v8}, Lcom/android/settings/DeviceInfoSettings;->setStringSummary(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    const-string v7, "firmware_version"

    sget-object v7, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-direct {p0, v11, v7}, Lcom/android/settings/DeviceInfoSettings;->setStringSummary(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    const-string v7, "firmware_version"

    invoke-virtual {p0, v11}, Lcom/android/settings/DeviceInfoSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    invoke-virtual {v7, v10}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 80
    const-string v7, "baseband_version"

    const-string v8, "gsm.version.baseband"

    invoke-direct {p0, v7, v8}, Lcom/android/settings/DeviceInfoSettings;->setValueSummary(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    const-string v7, "device_model"

    sget-object v8, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-direct {p0, v7, v8}, Lcom/android/settings/DeviceInfoSettings;->setStringSummary(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    const-string v7, "build_number"

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    invoke-direct {p0, v7, v8}, Lcom/android/settings/DeviceInfoSettings;->setStringSummary(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    const-string v7, "kernel_version"

    invoke-virtual {p0, v7}, Lcom/android/settings/DeviceInfoSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    invoke-direct {p0}, Lcom/android/settings/DeviceInfoSettings;->getFormattedKernelVersion()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 84
    const-string v7, "mod_version"

    const-string v7, "ro.modversion"

    invoke-direct {p0, v12, v7}, Lcom/android/settings/DeviceInfoSettings;->setValueSummary(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    const-string v7, "mod_version"

    invoke-virtual {p0, v12}, Lcom/android/settings/DeviceInfoSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    invoke-virtual {v7, v10}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 86
    const-string v7, "build_date"

    const-string v8, "ro.build.date"

    invoke-direct {p0, v7, v8}, Lcom/android/settings/DeviceInfoSettings;->setValueSummary(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    invoke-virtual {p0}, Lcom/android/settings/DeviceInfoSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v7

    const-string v8, "safetylegal"

    const-string v9, "ro.url.safetylegal"

    invoke-direct {p0, v7, v8, v9}, Lcom/android/settings/DeviceInfoSettings;->removePreferenceIfPropertyMissing(Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    const-string v7, "container"

    invoke-virtual {p0, v7}, Lcom/android/settings/DeviceInfoSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/preference/PreferenceGroup;

    .line 99
    .local v4, parentPreference:Landroid/preference/PreferenceGroup;
    const-string v7, "terms"

    invoke-static {p0, v4, v7, v10}, Lcom/android/settings/Utils;->updatePreferenceToSpecificActivityOrRemove(Landroid/content/Context;Landroid/preference/PreferenceGroup;Ljava/lang/String;I)Z

    .line 101
    const-string v7, "license"

    invoke-static {p0, v4, v7, v10}, Lcom/android/settings/Utils;->updatePreferenceToSpecificActivityOrRemove(Landroid/content/Context;Landroid/preference/PreferenceGroup;Ljava/lang/String;I)Z

    .line 103
    const-string v7, "copyright"

    invoke-static {p0, v4, v7, v10}, Lcom/android/settings/Utils;->updatePreferenceToSpecificActivityOrRemove(Landroid/content/Context;Landroid/preference/PreferenceGroup;Ljava/lang/String;I)Z

    .line 105
    const-string v7, "team"

    invoke-static {p0, v4, v7, v10}, Lcom/android/settings/Utils;->updatePreferenceToSpecificActivityOrRemove(Landroid/content/Context;Landroid/preference/PreferenceGroup;Ljava/lang/String;I)Z

    .line 109
    invoke-virtual {p0}, Lcom/android/settings/DeviceInfoSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    .line 110
    const-string v7, "system_update_settings"

    invoke-static {p0, v4, v7, v10}, Lcom/android/settings/Utils;->updatePreferenceToSpecificActivityOrRemove(Landroid/content/Context;Landroid/preference/PreferenceGroup;Ljava/lang/String;I)Z

    .line 113
    const-string v7, "contributors"

    invoke-static {p0, v4, v7, v10}, Lcom/android/settings/Utils;->updatePreferenceToSpecificActivityOrRemove(Landroid/content/Context;Landroid/preference/PreferenceGroup;Ljava/lang/String;I)Z

    .line 117
    invoke-virtual {p0}, Lcom/android/settings/DeviceInfoSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f060002

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    .line 120
    .local v3, mUpdateSettingAvailable:Z
    if-nez v3, :cond_2

    .line 121
    invoke-virtual {p0}, Lcom/android/settings/DeviceInfoSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v7

    const-string v8, "additional_system_update_settings"

    invoke-virtual {p0, v8}, Lcom/android/settings/DeviceInfoSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 123
    :cond_2
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 9
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    const/4 v5, 0x0

    const/4 v7, 0x1

    const-string v8, "mod_version"

    .line 127
    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    const-string v2, "firmware_version"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    const-string v2, "mod_version"

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 129
    :cond_0
    iget-object v1, p0, Lcom/android/settings/DeviceInfoSettings;->mHits:[J

    iget-object v2, p0, Lcom/android/settings/DeviceInfoSettings;->mHits:[J

    iget-object v3, p0, Lcom/android/settings/DeviceInfoSettings;->mHits:[J

    array-length v3, v3

    sub-int/2addr v3, v7

    invoke-static {v1, v7, v2, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 130
    iget-object v1, p0, Lcom/android/settings/DeviceInfoSettings;->mHits:[J

    iget-object v2, p0, Lcom/android/settings/DeviceInfoSettings;->mHits:[J

    array-length v2, v2

    sub-int/2addr v2, v7

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    aput-wide v3, v1, v2

    .line 131
    iget-object v1, p0, Lcom/android/settings/DeviceInfoSettings;->mHits:[J

    aget-wide v1, v1, v5

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x1f4

    sub-long/2addr v3, v5

    cmp-long v1, v1, v3

    if-ltz v1, :cond_2

    .line 132
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 133
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "android"

    const-class v2, Lcom/android/internal/app/PlatLogoActivity;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 135
    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    const-string v2, "mod_version"

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 136
    const-string v1, "special"

    invoke-virtual {v0, v1, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 139
    :cond_1
    :try_start_0
    invoke-virtual {p0, v0}, Lcom/android/settings/DeviceInfoSettings;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 144
    .end local v0           #intent:Landroid/content/Intent;
    :cond_2
    :goto_0
    invoke-super {p0, p1, p2}, Landroid/preference/PreferenceActivity;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v1

    return v1

    .line 140
    .restart local v0       #intent:Landroid/content/Intent;
    :catch_0
    move-exception v1

    goto :goto_0
.end method
