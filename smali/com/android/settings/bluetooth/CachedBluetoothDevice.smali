.class public Lcom/android/settings/bluetooth/CachedBluetoothDevice;
.super Ljava/lang/Object;
.source "CachedBluetoothDevice.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/settings/bluetooth/CachedBluetoothDevice$Callback;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/android/settings/bluetooth/CachedBluetoothDevice;",
        ">;"
    }
.end annotation


# static fields
.field private static final CONTEXT_ITEM_CONNECT:I = 0x2

.field private static final CONTEXT_ITEM_CONNECT_ADVANCED:I = 0x5

.field private static final CONTEXT_ITEM_DISCONNECT:I = 0x3

.field private static final CONTEXT_ITEM_UNPAIR:I = 0x4

.field private static final D:Z = true

.field private static final DEBUG:Z = true

.field private static final MAX_UUID_DELAY_FOR_AUTO_CONNECT:J = 0x1388L

.field private static final TAG:Ljava/lang/String; = "CachedBluetoothDevice"

.field private static final V:Z


# instance fields
.field private mBtClass:Landroid/bluetooth/BluetoothClass;

.field private mCallbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/settings/bluetooth/CachedBluetoothDevice$Callback;",
            ">;"
        }
    .end annotation
.end field

.field private mConnectAfterPairing:Z

.field private mConnectAttempted:J

.field private final mDevice:Landroid/bluetooth/BluetoothDevice;

.field private mDialog:Landroid/app/AlertDialog;

.field private mIsConnectingErrorPossible:Z

.field private final mLocalManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;

.field private mName:Ljava/lang/String;

.field private mProfiles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;",
            ">;"
        }
    .end annotation
.end field

.field private mRssi:S

.field private mVisible:Z


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/bluetooth/BluetoothDevice;)V
    .locals 2
    .parameter "context"
    .parameter "device"

    .prologue
    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    .line 70
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDialog:Landroid/app/AlertDialog;

    .line 72
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mCallbacks:Ljava/util/List;

    .line 131
    invoke-static {p1}, Lcom/android/settings/bluetooth/LocalBluetoothManager;->getInstance(Landroid/content/Context;)Lcom/android/settings/bluetooth/LocalBluetoothManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mLocalManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;

    .line 132
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mLocalManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;

    if-nez v0, :cond_0

    .line 133
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot use CachedBluetoothDevice without Bluetooth hardware"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 137
    :cond_0
    iput-object p2, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    .line 139
    invoke-direct {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->fillData()V

    .line 140
    return-void
.end method

.method private connectAllProfiles()V
    .locals 5

    .prologue
    .line 272
    invoke-direct {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->ensurePaired()Z

    move-result v3

    if-nez v3, :cond_1

    .line 286
    :cond_0
    return-void

    .line 275
    :cond_1
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mIsConnectingErrorPossible:Z

    .line 277
    iget-object v3, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;

    .line 278
    .local v1, profile:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;
    invoke-direct {p0, v1}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->isConnectableProfile(Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 279
    iget-object v3, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mLocalManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;

    invoke-static {v3, v1}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->getProfileManager(Lcom/android/settings/bluetooth/LocalBluetoothManager;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;

    move-result-object v2

    .line 281
    .local v2, profileManager:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;
    iget-object v3, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->setPreferred(Landroid/bluetooth/BluetoothDevice;Z)V

    .line 282
    invoke-direct {p0, p0, v1}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->disconnectConnected(Lcom/android/settings/bluetooth/CachedBluetoothDevice;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)V

    .line 283
    invoke-direct {p0, p0, v1}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->connectInt(Lcom/android/settings/bluetooth/CachedBluetoothDevice;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Z

    goto :goto_0
.end method

.method private connectInt(Lcom/android/settings/bluetooth/CachedBluetoothDevice;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Z
    .locals 6
    .parameter "cachedDevice"
    .parameter "profile"

    .prologue
    const/4 v4, 0x0

    const-string v5, "CachedBluetoothDevice"

    .line 312
    invoke-direct {p1}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->ensurePaired()Z

    move-result v2

    if-nez v2, :cond_0

    move v2, v4

    .line 325
    :goto_0
    return v2

    .line 314
    :cond_0
    iget-object v2, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mLocalManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;

    invoke-static {v2, p2}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->getProfileManager(Lcom/android/settings/bluetooth/LocalBluetoothManager;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;

    move-result-object v0

    .line 316
    .local v0, profileManager:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;
    iget-object v2, p1, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0, v2}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->getConnectionStatus(Landroid/bluetooth/BluetoothDevice;)I

    move-result v1

    .line 317
    .local v1, status:I
    iget-object v2, p1, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0, v2}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->connect(Landroid/bluetooth/BluetoothDevice;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 319
    const-string v2, "CachedBluetoothDevice"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Command sent successfully:CONNECT "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0, p2}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->describe(Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 321
    const/4 v2, 0x1

    goto :goto_0

    .line 323
    :cond_1
    const-string v2, "CachedBluetoothDevice"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to connect "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p1, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v4

    .line 325
    goto :goto_0
.end method

.method private connectWithoutResettingTimer()V
    .locals 7

    .prologue
    const-string v6, "CachedBluetoothDevice"

    .line 240
    iget-object v4, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_1

    .line 241
    invoke-direct {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->updateProfiles()Z

    move-result v4

    if-nez v4, :cond_1

    .line 244
    const-string v4, "CachedBluetoothDevice"

    const-string v4, "No profiles. Maybe we will connect later"

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 269
    :cond_0
    :goto_0
    return-void

    .line 250
    :cond_1
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mIsConnectingErrorPossible:Z

    .line 252
    const/4 v1, 0x0

    .line 253
    .local v1, preferredProfiles:I
    iget-object v4, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;

    .line 254
    .local v2, profile:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;
    invoke-direct {p0, v2}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->isConnectableProfile(Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 255
    iget-object v4, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mLocalManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;

    invoke-static {v4, v2}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->getProfileManager(Lcom/android/settings/bluetooth/LocalBluetoothManager;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;

    move-result-object v3

    .line 257
    .local v3, profileManager:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;
    iget-object v4, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v3, v4}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->isPreferred(Landroid/bluetooth/BluetoothDevice;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 258
    add-int/lit8 v1, v1, 0x1

    .line 259
    invoke-direct {p0, p0, v2}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->disconnectConnected(Lcom/android/settings/bluetooth/CachedBluetoothDevice;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)V

    .line 260
    invoke-direct {p0, p0, v2}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->connectInt(Lcom/android/settings/bluetooth/CachedBluetoothDevice;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Z

    goto :goto_1

    .line 264
    .end local v2           #profile:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;
    .end local v3           #profileManager:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;
    :cond_3
    const-string v4, "CachedBluetoothDevice"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Preferred profiles = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 266
    if-nez v1, :cond_0

    .line 267
    invoke-direct {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->connectAllProfiles()V

    goto :goto_0
.end method

.method private describe(Lcom/android/settings/bluetooth/CachedBluetoothDevice;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Ljava/lang/String;
    .locals 3
    .parameter "cachedDevice"
    .parameter "profile"

    .prologue
    .line 101
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 102
    .local v0, sb:Ljava/lang/StringBuilder;
    const-string v1, "Address:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 103
    if-eqz p2, :cond_0

    .line 104
    const-string v1, " Profile:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private describe(Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Ljava/lang/String;
    .locals 1
    .parameter "profile"

    .prologue
    .line 111
    invoke-direct {p0, p0, p1}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->describe(Lcom/android/settings/bluetooth/CachedBluetoothDevice;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private disconnectConnected(Lcom/android/settings/bluetooth/CachedBluetoothDevice;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)V
    .locals 7
    .parameter "device"
    .parameter "profile"

    .prologue
    .line 297
    iget-object v6, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mLocalManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;

    invoke-static {v6, p2}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->getProfileManager(Lcom/android/settings/bluetooth/LocalBluetoothManager;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;

    move-result-object v5

    .line 299
    .local v5, profileManager:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;
    iget-object v6, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mLocalManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;

    invoke-virtual {v6}, Lcom/android/settings/bluetooth/LocalBluetoothManager;->getCachedDeviceManager()Lcom/android/settings/bluetooth/CachedBluetoothDeviceManager;

    move-result-object v2

    .line 300
    .local v2, cachedDeviceManager:Lcom/android/settings/bluetooth/CachedBluetoothDeviceManager;
    invoke-virtual {v5}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->getConnectedDevices()Ljava/util/Set;

    move-result-object v3

    .line 301
    .local v3, devices:Ljava/util/Set;,"Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    if-nez v3, :cond_1

    .line 309
    :cond_0
    return-void

    .line 302
    :cond_1
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothDevice;

    .line 303
    .local v0, btDevice:Landroid/bluetooth/BluetoothDevice;
    invoke-virtual {v2, v0}, Lcom/android/settings/bluetooth/CachedBluetoothDeviceManager;->findDevice(Landroid/bluetooth/BluetoothDevice;)Lcom/android/settings/bluetooth/CachedBluetoothDevice;

    move-result-object v1

    .line 305
    .local v1, cachedDevice:Lcom/android/settings/bluetooth/CachedBluetoothDevice;
    if-eqz v1, :cond_2

    invoke-virtual {v1, p1}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 306
    invoke-direct {p0, v1, p2}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->disconnectInt(Lcom/android/settings/bluetooth/CachedBluetoothDevice;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Z

    goto :goto_0
.end method

.method private disconnectInt(Lcom/android/settings/bluetooth/CachedBluetoothDevice;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Z
    .locals 5
    .parameter "cachedDevice"
    .parameter "profile"

    .prologue
    .line 165
    iget-object v2, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mLocalManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;

    invoke-static {v2, p2}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->getProfileManager(Lcom/android/settings/bluetooth/LocalBluetoothManager;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;

    move-result-object v0

    .line 167
    .local v0, profileManager:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;
    iget-object v2, p1, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0, v2}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->getConnectionStatus(Landroid/bluetooth/BluetoothDevice;)I

    move-result v1

    .line 168
    .local v1, status:I
    iget-object v2, p1, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0, v2}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->disconnect(Landroid/bluetooth/BluetoothDevice;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 170
    const-string v2, "CachedBluetoothDevice"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Command sent successfully:DISCONNECT "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-direct {p0, p2}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->describe(Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    const/4 v2, 0x1

    .line 174
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private dispatchAttributesChanged()V
    .locals 4

    .prologue
    .line 814
    iget-object v2, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mCallbacks:Ljava/util/List;

    monitor-enter v2

    .line 815
    :try_start_0
    iget-object v3, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mCallbacks:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/settings/bluetooth/CachedBluetoothDevice$Callback;

    .line 816
    .local v0, callback:Lcom/android/settings/bluetooth/CachedBluetoothDevice$Callback;
    invoke-interface {v0, p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice$Callback;->onDeviceAttributesChanged(Lcom/android/settings/bluetooth/CachedBluetoothDevice;)V

    goto :goto_0

    .line 818
    .end local v0           #callback:Lcom/android/settings/bluetooth/CachedBluetoothDevice$Callback;
    .end local v1           #i$:Ljava/util/Iterator;
    :catchall_0
    move-exception v3

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .restart local v1       #i$:Ljava/util/Iterator;
    :cond_0
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 819
    return-void
.end method

.method private ensurePaired()Z
    .locals 2

    .prologue
    .line 337
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->getBondState()I

    move-result v0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_0

    .line 338
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->pair()V

    .line 339
    const/4 v0, 0x0

    .line 341
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private fetchBtClass()V
    .locals 1

    .prologue
    .line 530
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getBluetoothClass()Landroid/bluetooth/BluetoothClass;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mBtClass:Landroid/bluetooth/BluetoothClass;

    .line 531
    return-void
.end method

.method private fetchName()V
    .locals 3

    .prologue
    .line 422
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mName:Ljava/lang/String;

    .line 424
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 425
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mName:Ljava/lang/String;

    .line 426
    const-string v0, "CachedBluetoothDevice"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Default to address. Device has no name (yet) "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 428
    :cond_0
    return-void
.end method

.method private fillData()V
    .locals 1

    .prologue
    .line 388
    invoke-direct {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->fetchName()V

    .line 389
    invoke-direct {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->fetchBtClass()V

    .line 390
    invoke-direct {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->updateProfiles()Z

    .line 392
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mVisible:Z

    .line 394
    invoke-direct {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->dispatchAttributesChanged()V

    .line 395
    return-void
.end method

.method private getOneOffSummary()I
    .locals 10

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x3

    const/4 v7, 0x0

    .line 667
    const/4 v0, 0x0

    .local v0, isA2dpConnected:Z
    const/4 v2, 0x0

    .local v2, isHeadsetConnected:Z
    const/4 v1, 0x0

    .line 668
    .local v1, isConnecting:Z
    const/4 v3, 0x0

    .line 669
    .local v3, isHidConnected:Z
    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    sget-object v6, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;->A2DP:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;

    invoke-interface {v5, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 670
    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mLocalManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;

    sget-object v6, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;->A2DP:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;

    invoke-static {v5, v6}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->getProfileManager(Lcom/android/settings/bluetooth/LocalBluetoothManager;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;

    move-result-object v4

    .line 672
    .local v4, profileManager:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;
    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v4, v5}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->getConnectionStatus(Landroid/bluetooth/BluetoothDevice;)I

    move-result v5

    if-ne v5, v8, :cond_3

    move v1, v9

    .line 674
    :goto_0
    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v4, v5}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->isConnected(Landroid/bluetooth/BluetoothDevice;)Z

    move-result v0

    .line 677
    .end local v4           #profileManager:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;
    :cond_0
    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    sget-object v6, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;->HEADSET:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;

    invoke-interface {v5, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 678
    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mLocalManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;

    sget-object v6, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;->HEADSET:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;

    invoke-static {v5, v6}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->getProfileManager(Lcom/android/settings/bluetooth/LocalBluetoothManager;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;

    move-result-object v4

    .line 680
    .restart local v4       #profileManager:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;
    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v4, v5}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->getConnectionStatus(Landroid/bluetooth/BluetoothDevice;)I

    move-result v5

    if-ne v5, v8, :cond_4

    move v5, v9

    :goto_1
    or-int/2addr v1, v5

    .line 682
    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v4, v5}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->isConnected(Landroid/bluetooth/BluetoothDevice;)Z

    move-result v2

    .line 685
    .end local v4           #profileManager:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;
    :cond_1
    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    sget-object v6, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;->HID:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;

    invoke-interface {v5, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 686
    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mLocalManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;

    sget-object v6, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;->HID:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;

    invoke-static {v5, v6}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->getProfileManager(Lcom/android/settings/bluetooth/LocalBluetoothManager;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;

    move-result-object v4

    .line 688
    .restart local v4       #profileManager:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;
    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v4, v5}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->getConnectionStatus(Landroid/bluetooth/BluetoothDevice;)I

    move-result v5

    if-ne v5, v8, :cond_5

    move v5, v9

    :goto_2
    or-int/2addr v1, v5

    .line 690
    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v4, v5}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->isConnected(Landroid/bluetooth/BluetoothDevice;)Z

    move-result v3

    .line 693
    .end local v4           #profileManager:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;
    :cond_2
    if-eqz v1, :cond_6

    .line 695
    invoke-static {v8}, Lcom/android/settings/bluetooth/SettingsBtStatus;->getConnectionStatusSummary(I)I

    move-result v5

    .line 706
    :goto_3
    return v5

    .restart local v4       #profileManager:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;
    :cond_3
    move v1, v7

    .line 672
    goto :goto_0

    :cond_4
    move v5, v7

    .line 680
    goto :goto_1

    :cond_5
    move v5, v7

    .line 688
    goto :goto_2

    .line 697
    .end local v4           #profileManager:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;
    :cond_6
    if-eqz v0, :cond_7

    if-eqz v2, :cond_7

    .line 698
    const v5, 0x7f08013e

    goto :goto_3

    .line 699
    :cond_7
    if-eqz v0, :cond_8

    .line 700
    const v5, 0x7f08013c

    goto :goto_3

    .line 701
    :cond_8
    if-eqz v2, :cond_9

    .line 702
    const v5, 0x7f08013d

    goto :goto_3

    .line 703
    :cond_9
    if-eqz v3, :cond_a

    .line 704
    const v5, 0x7f08013f

    goto :goto_3

    :cond_a
    move v5, v7

    .line 706
    goto :goto_3
.end method

.method private isConnectableProfile(Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Z
    .locals 1
    .parameter "profile"

    .prologue
    .line 721
    sget-object v0, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;->HEADSET:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;

    invoke-virtual {p1, v0}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;->A2DP:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;

    invoke-virtual {p1, v0}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;->HID:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;

    invoke-virtual {p1, v0}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private updateProfiles()Z
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/4 v6, 0x0

    const-string v7, "CachedBluetoothDevice"

    .line 534
    iget-object v4, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v4}, Landroid/bluetooth/BluetoothDevice;->getUuids()[Landroid/os/ParcelUuid;

    move-result-object v3

    .line 535
    .local v3, uuids:[Landroid/os/ParcelUuid;
    if-nez v3, :cond_0

    move v4, v6

    .line 578
    :goto_0
    return v4

    .line 537
    :cond_0
    iget-object v4, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-static {v3, v4}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->updateProfiles([Landroid/os/ParcelUuid;Ljava/util/List;)V

    .line 540
    const-string v4, "CachedBluetoothDevice"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "updating profiles for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v5}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 542
    const/4 v2, 0x1

    .line 543
    .local v2, printUuids:Z
    iget-object v4, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v4}, Landroid/bluetooth/BluetoothDevice;->getBluetoothClass()Landroid/bluetooth/BluetoothClass;

    move-result-object v0

    .line 545
    .local v0, bluetoothClass:Landroid/bluetooth/BluetoothClass;
    if-eqz v0, :cond_4

    .line 546
    invoke-virtual {v0, v6}, Landroid/bluetooth/BluetoothClass;->doesClassMatch(I)Z

    move-result v4

    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    sget-object v6, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;->HEADSET:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;

    invoke-interface {v5, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eq v4, v5, :cond_1

    .line 548
    const-string v4, "CachedBluetoothDevice"

    const-string v4, "headset classbits != uuid"

    invoke-static {v7, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 549
    const/4 v2, 0x1

    .line 552
    :cond_1
    invoke-virtual {v0, v8}, Landroid/bluetooth/BluetoothClass;->doesClassMatch(I)Z

    move-result v4

    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    sget-object v6, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;->A2DP:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;

    invoke-interface {v5, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eq v4, v5, :cond_2

    .line 554
    const-string v4, "CachedBluetoothDevice"

    const-string v4, "a2dp classbits != uuid"

    invoke-static {v7, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 555
    const/4 v2, 0x1

    .line 558
    :cond_2
    const/4 v4, 0x2

    invoke-virtual {v0, v4}, Landroid/bluetooth/BluetoothClass;->doesClassMatch(I)Z

    move-result v4

    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    sget-object v6, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;->OPP:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;

    invoke-interface {v5, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eq v4, v5, :cond_3

    .line 560
    const-string v4, "CachedBluetoothDevice"

    const-string v4, "opp classbits != uuid"

    invoke-static {v7, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 561
    const/4 v2, 0x1

    .line 563
    :cond_3
    const/4 v4, 0x3

    invoke-virtual {v0, v4}, Landroid/bluetooth/BluetoothClass;->doesClassMatch(I)Z

    move-result v4

    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    sget-object v6, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;->HID:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;

    invoke-interface {v5, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eq v4, v5, :cond_4

    .line 565
    const-string v4, "CachedBluetoothDevice"

    const-string v4, "HID classbits != uuid"

    invoke-static {v7, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 566
    const/4 v2, 0x1

    .line 570
    :cond_4
    if-eqz v2, :cond_6

    .line 571
    if-eqz v0, :cond_5

    const-string v4, "CachedBluetoothDevice"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Class: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothClass;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 572
    :cond_5
    const-string v4, "CachedBluetoothDevice"

    const-string v4, "UUID:"

    invoke-static {v7, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 573
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v4, v3

    if-ge v1, v4, :cond_6

    .line 574
    const-string v4, "CachedBluetoothDevice"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "  "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, v3, v1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 573
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .end local v1           #i:I
    :cond_6
    move v4, v8

    .line 578
    goto/16 :goto_0
.end method


# virtual methods
.method public askDisconnect()V
    .locals 8

    .prologue
    .line 178
    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mLocalManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;

    invoke-virtual {v5}, Lcom/android/settings/bluetooth/LocalBluetoothManager;->getForegroundActivity()Landroid/app/Activity;

    move-result-object v0

    .line 179
    .local v0, context:Landroid/content/Context;
    if-nez v0, :cond_0

    .line 181
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->disconnect()V

    .line 212
    :goto_0
    return-void

    .line 185
    :cond_0
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 187
    .local v4, res:Landroid/content/res/Resources;
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v3

    .line 188
    .local v3, name:Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 189
    const v5, 0x7f080060

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 191
    :cond_1
    const v5, 0x7f080057

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v3, v6, v7

    invoke-virtual {v4, v5, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 193
    .local v2, message:Ljava/lang/String;
    new-instance v1, Lcom/android/settings/bluetooth/CachedBluetoothDevice$1;

    invoke-direct {v1, p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice$1;-><init>(Lcom/android/settings/bluetooth/CachedBluetoothDevice;)V

    .line 199
    .local v1, disconnectListener:Landroid/content/DialogInterface$OnClickListener;
    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDialog:Landroid/app/AlertDialog;

    if-nez v5, :cond_3

    .line 200
    new-instance v5, Landroid/app/AlertDialog$Builder;

    invoke-direct {v5, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v6, 0x104000a

    invoke-virtual {v5, v6, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    const/high16 v6, 0x104

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v5

    iput-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDialog:Landroid/app/AlertDialog;

    .line 209
    :cond_2
    :goto_1
    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 210
    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v5, v2}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 211
    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v5}, Landroid/app/AlertDialog;->show()V

    goto :goto_0

    .line 205
    :cond_3
    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v5}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 206
    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v5}, Landroid/app/AlertDialog;->dismiss()V

    goto :goto_1
.end method

.method public compareTo(Lcom/android/settings/bluetooth/CachedBluetoothDevice;)I
    .locals 6
    .parameter "another"

    .prologue
    const/16 v5, 0xc

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 844
    invoke-virtual {p1}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v4

    :goto_0
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_1

    move v2, v4

    :goto_1
    sub-int v0, v1, v2

    .line 845
    .local v0, comparison:I
    if-eqz v0, :cond_2

    move v1, v0

    .line 861
    :goto_2
    return v1

    .end local v0           #comparison:I
    :cond_0
    move v1, v3

    .line 844
    goto :goto_0

    :cond_1
    move v2, v3

    goto :goto_1

    .line 848
    .restart local v0       #comparison:I
    :cond_2
    invoke-virtual {p1}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->getBondState()I

    move-result v1

    if-ne v1, v5, :cond_3

    move v1, v4

    :goto_3
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->getBondState()I

    move-result v2

    if-ne v2, v5, :cond_4

    move v2, v4

    :goto_4
    sub-int v0, v1, v2

    .line 850
    if-eqz v0, :cond_5

    move v1, v0

    goto :goto_2

    :cond_3
    move v1, v3

    .line 848
    goto :goto_3

    :cond_4
    move v2, v3

    goto :goto_4

    .line 853
    :cond_5
    iget-boolean v1, p1, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mVisible:Z

    if-eqz v1, :cond_6

    move v1, v4

    :goto_5
    iget-boolean v2, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mVisible:Z

    if-eqz v2, :cond_7

    move v2, v4

    :goto_6
    sub-int v0, v1, v2

    .line 854
    if-eqz v0, :cond_8

    move v1, v0

    goto :goto_2

    :cond_6
    move v1, v3

    .line 853
    goto :goto_5

    :cond_7
    move v2, v3

    goto :goto_6

    .line 857
    :cond_8
    iget-short v1, p1, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mRssi:S

    iget-short v2, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mRssi:S

    sub-int v0, v1, v2

    .line 858
    if-eqz v0, :cond_9

    move v1, v0

    goto :goto_2

    .line 861
    :cond_9
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    goto :goto_2
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 48
    check-cast p1, Lcom/android/settings/bluetooth/CachedBluetoothDevice;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->compareTo(Lcom/android/settings/bluetooth/CachedBluetoothDevice;)I

    move-result v0

    return v0
.end method

.method public connect()V
    .locals 2

    .prologue
    .line 225
    invoke-direct {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->ensurePaired()Z

    move-result v0

    if-nez v0, :cond_0

    .line 230
    :goto_0
    return-void

    .line 227
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mConnectAttempted:J

    .line 229
    invoke-direct {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->connectWithoutResettingTimer()V

    goto :goto_0
.end method

.method public connect(Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)V
    .locals 2
    .parameter "profile"

    .prologue
    .line 289
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mConnectAttempted:J

    .line 291
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mIsConnectingErrorPossible:Z

    .line 292
    invoke-direct {p0, p0, p1}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->disconnectConnected(Lcom/android/settings/bluetooth/CachedBluetoothDevice;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)V

    .line 293
    invoke-direct {p0, p0, p1}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->connectInt(Lcom/android/settings/bluetooth/CachedBluetoothDevice;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Z

    .line 294
    return-void
.end method

.method public disconnect()V
    .locals 3

    .prologue
    .line 155
    iget-object v2, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;

    .line 156
    .local v1, profile:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;
    invoke-virtual {p0, v1}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->disconnect(Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)V

    goto :goto_0

    .line 158
    .end local v1           #profile:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;
    :cond_0
    return-void
.end method

.method public disconnect(Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)V
    .locals 0
    .parameter "profile"

    .prologue
    .line 161
    invoke-direct {p0, p0, p1}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->disconnectInt(Lcom/android/settings/bluetooth/CachedBluetoothDevice;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Z

    .line 162
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .parameter "o"

    .prologue
    .line 828
    if-eqz p1, :cond_0

    instance-of v0, p1, Lcom/android/settings/bluetooth/CachedBluetoothDevice;

    if-nez v0, :cond_1

    .line 829
    :cond_0
    new-instance v0, Ljava/lang/ClassCastException;

    invoke-direct {v0}, Ljava/lang/ClassCastException;-><init>()V

    throw v0

    .line 832
    :cond_1
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    check-cast p1, Lcom/android/settings/bluetooth/CachedBluetoothDevice;

    .end local p1
    iget-object v1, p1, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0, v1}, Landroid/bluetooth/BluetoothDevice;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 216
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 217
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 218
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDialog:Landroid/app/AlertDialog;

    .line 221
    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 222
    return-void
.end method

.method public getBondState()I
    .locals 1

    .prologue
    .line 446
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getBondState()I

    move-result v0

    return v0
.end method

.method public getBtClassDrawable()I
    .locals 6

    .prologue
    const v5, 0x7f020054

    const v4, 0x7f020053

    const v3, 0x7f020052

    const/4 v2, 0x0

    .line 490
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mBtClass:Landroid/bluetooth/BluetoothClass;

    if-eqz v0, :cond_0

    .line 491
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mBtClass:Landroid/bluetooth/BluetoothClass;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothClass;->getMajorDeviceClass()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 502
    :goto_0
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_3

    .line 503
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    sget-object v1, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;->A2DP:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, v3

    .line 523
    :goto_1
    return v0

    .line 493
    :sswitch_0
    const v0, 0x7f020055

    goto :goto_1

    .line 496
    :sswitch_1
    const v0, 0x7f020051

    goto :goto_1

    .line 499
    :cond_0
    const-string v0, "CachedBluetoothDevice"

    const-string v1, "mBtClass is null"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 505
    :cond_1
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    sget-object v1, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;->HEADSET:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    move v0, v4

    .line 506
    goto :goto_1

    .line 507
    :cond_2
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    sget-object v1, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;->HID:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    move v0, v5

    .line 508
    goto :goto_1

    .line 510
    :cond_3
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mBtClass:Landroid/bluetooth/BluetoothClass;

    if-eqz v0, :cond_6

    .line 511
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mBtClass:Landroid/bluetooth/BluetoothClass;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/bluetooth/BluetoothClass;->doesClassMatch(I)Z

    move-result v0

    if-eqz v0, :cond_4

    move v0, v3

    .line 512
    goto :goto_1

    .line 515
    :cond_4
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mBtClass:Landroid/bluetooth/BluetoothClass;

    invoke-virtual {v0, v2}, Landroid/bluetooth/BluetoothClass;->doesClassMatch(I)Z

    move-result v0

    if-eqz v0, :cond_5

    move v0, v4

    .line 516
    goto :goto_1

    .line 518
    :cond_5
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mBtClass:Landroid/bluetooth/BluetoothClass;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/bluetooth/BluetoothClass;->doesClassMatch(I)Z

    move-result v0

    if-eqz v0, :cond_6

    move v0, v5

    .line 519
    goto :goto_1

    :cond_6
    move v0, v2

    .line 523
    goto :goto_1

    .line 491
    nop

    :sswitch_data_0
    .sparse-switch
        0x100 -> :sswitch_0
        0x200 -> :sswitch_1
    .end sparse-switch
.end method

.method public getConnectableProfiles()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 711
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 712
    .local v0, connectableProfiles:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;>;"
    iget-object v3, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;

    .line 713
    .local v2, profile:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;
    invoke-direct {p0, v2}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->isConnectableProfile(Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 714
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 717
    .end local v2           #profile:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;
    :cond_1
    return-object v0
.end method

.method public getDevice()Landroid/bluetooth/BluetoothDevice;
    .locals 1

    .prologue
    .line 398
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 402
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getSummary()I
    .locals 6

    .prologue
    .line 640
    invoke-direct {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->getOneOffSummary()I

    move-result v2

    .line 641
    .local v2, oneOffSummary:I
    if-eqz v2, :cond_0

    move v5, v2

    .line 657
    :goto_0
    return v5

    .line 645
    :cond_0
    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;

    .line 646
    .local v3, profile:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;
    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mLocalManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;

    invoke-static {v5, v3}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->getProfileManager(Lcom/android/settings/bluetooth/LocalBluetoothManager;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;

    move-result-object v4

    .line 648
    .local v4, profileManager:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;
    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v4, v5}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->getConnectionStatus(Landroid/bluetooth/BluetoothDevice;)I

    move-result v0

    .line 650
    .local v0, connectionStatus:I
    invoke-static {v0}, Lcom/android/settings/bluetooth/SettingsBtStatus;->isConnectionStatusConnected(I)Z

    move-result v5

    if-nez v5, :cond_2

    const/4 v5, 0x3

    if-eq v0, v5, :cond_2

    const/4 v5, 0x5

    if-ne v0, v5, :cond_1

    .line 653
    :cond_2
    invoke-static {v0}, Lcom/android/settings/bluetooth/SettingsBtStatus;->getConnectionStatusSummary(I)I

    move-result v5

    goto :goto_0

    .line 657
    .end local v0           #connectionStatus:I
    .end local v3           #profile:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;
    .end local v4           #profileManager:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;
    :cond_3
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->getBondState()I

    move-result v5

    invoke-static {v5}, Lcom/android/settings/bluetooth/SettingsBtStatus;->getPairingStatusSummary(I)I

    move-result v5

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 837
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public isBusy()Z
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 474
    iget-object v3, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;

    .line 475
    .local v1, profile:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;
    iget-object v3, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mLocalManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;

    invoke-static {v3, v1}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->getProfileManager(Lcom/android/settings/bluetooth/LocalBluetoothManager;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;

    move-result-object v3

    iget-object v4, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v3, v4}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->getConnectionStatus(Landroid/bluetooth/BluetoothDevice;)I

    move-result v2

    .line 477
    .local v2, status:I
    invoke-static {v2}, Lcom/android/settings/bluetooth/SettingsBtStatus;->isConnectionStatusBusy(I)Z

    move-result v3

    if-eqz v3, :cond_0

    move v3, v5

    .line 486
    .end local v1           #profile:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;
    .end local v2           #status:I
    :goto_0
    return v3

    .line 482
    :cond_1
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->getBondState()I

    move-result v3

    const/16 v4, 0xb

    if-ne v3, v4, :cond_2

    move v3, v5

    .line 483
    goto :goto_0

    .line 486
    :cond_2
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public isConnected()Z
    .locals 5

    .prologue
    .line 462
    iget-object v3, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;

    .line 463
    .local v1, profile:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;
    iget-object v3, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mLocalManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;

    invoke-static {v3, v1}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->getProfileManager(Lcom/android/settings/bluetooth/LocalBluetoothManager;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;

    move-result-object v3

    iget-object v4, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v3, v4}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->getConnectionStatus(Landroid/bluetooth/BluetoothDevice;)I

    move-result v2

    .line 465
    .local v2, status:I
    invoke-static {v2}, Lcom/android/settings/bluetooth/SettingsBtStatus;->isConnectionStatusConnected(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 466
    const/4 v3, 0x1

    .line 470
    .end local v1           #profile:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;
    .end local v2           #status:I
    :goto_0
    return v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public isVisible()Z
    .locals 1

    .prologue
    .line 435
    iget-boolean v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mVisible:Z

    return v0
.end method

.method onBondingDockConnect()V
    .locals 0

    .prologue
    .line 235
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->connect()V

    .line 236
    return-void
.end method

.method public onBondingStateChanged(I)V
    .locals 2
    .parameter "bondState"

    .prologue
    const/4 v1, 0x0

    .line 614
    const/16 v0, 0xa

    if-ne p1, v0, :cond_0

    .line 615
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 616
    iput-boolean v1, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mConnectAfterPairing:Z

    .line 619
    :cond_0
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->refresh()V

    .line 621
    const/16 v0, 0xc

    if-ne p1, v0, :cond_2

    .line 622
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->isBluetoothDock()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 623
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->onBondingDockConnect()V

    .line 627
    :cond_1
    :goto_0
    iput-boolean v1, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mConnectAfterPairing:Z

    .line 629
    :cond_2
    return-void

    .line 624
    :cond_3
    iget-boolean v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mConnectAfterPairing:Z

    if-eqz v0, :cond_1

    .line 625
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->connect()V

    goto :goto_0
.end method

.method public onClicked()V
    .locals 2

    .prologue
    .line 143
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->getBondState()I

    move-result v0

    .line 145
    .local v0, bondState:I
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 146
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->askDisconnect()V

    .line 152
    :cond_0
    :goto_0
    return-void

    .line 147
    :cond_1
    const/16 v1, 0xc

    if-ne v0, v1, :cond_2

    .line 148
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->connect()V

    goto :goto_0

    .line 149
    :cond_2
    const/16 v1, 0xa

    if-ne v0, v1, :cond_0

    .line 150
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->pair()V

    goto :goto_0
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)V
    .locals 4
    .parameter "item"

    .prologue
    .line 772
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 799
    :goto_0
    return-void

    .line 774
    :pswitch_0
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->disconnect()V

    goto :goto_0

    .line 778
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->connect()V

    goto :goto_0

    .line 782
    :pswitch_2
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->unpair()V

    goto :goto_0

    .line 786
    :pswitch_3
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 788
    .local v1, intent:Landroid/content/Intent;
    iget-object v2, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mLocalManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;

    invoke-virtual {v2}, Lcom/android/settings/bluetooth/LocalBluetoothManager;->getForegroundActivity()Landroid/app/Activity;

    move-result-object v0

    .line 789
    .local v0, context:Landroid/content/Context;
    if-nez v0, :cond_0

    .line 791
    iget-object v2, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mLocalManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;

    invoke-virtual {v2}, Lcom/android/settings/bluetooth/LocalBluetoothManager;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 792
    const/high16 v2, 0x1000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 794
    :cond_0
    const-class v2, Lcom/android/settings/bluetooth/ConnectSpecificProfilesActivity;

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 795
    const-string v2, "device"

    iget-object v3, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 796
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 772
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;)V
    .locals 10
    .parameter "menu"

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x2

    const/4 v7, 0x0

    .line 726
    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mLocalManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;

    invoke-virtual {v5}, Lcom/android/settings/bluetooth/LocalBluetoothManager;->getBluetoothState()I

    move-result v5

    const/16 v6, 0xc

    if-ne v5, v6, :cond_0

    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->isBusy()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 764
    :cond_0
    :goto_0
    return-void

    .line 730
    :cond_1
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->getBondState()I

    move-result v0

    .line 731
    .local v0, bondState:I
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->isConnected()Z

    move-result v3

    .line 732
    .local v3, isConnected:Z
    const/4 v1, 0x0

    .line 734
    .local v1, hasConnectableProfiles:Z
    iget-object v5, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;

    .line 735
    .local v4, profile:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;
    invoke-direct {p0, v4}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->isConnectableProfile(Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 736
    const/4 v1, 0x1

    .line 741
    .end local v4           #profile:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;
    :cond_3
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p1, v5}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    .line 743
    const/16 v5, 0xa

    if-ne v0, v5, :cond_4

    .line 744
    const v5, 0x7f080132

    invoke-interface {p1, v7, v8, v7, v5}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    goto :goto_0

    .line 746
    :cond_4
    if-eqz v3, :cond_5

    .line 747
    const/4 v5, 0x3

    const v6, 0x7f080131

    invoke-interface {p1, v7, v5, v7, v6}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 749
    const v5, 0x7f080134

    invoke-interface {p1, v7, v9, v7, v5}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 759
    :goto_1
    if-eqz v1, :cond_0

    .line 760
    const/4 v5, 0x5

    const v6, 0x7f080135

    invoke-interface {p1, v7, v5, v7, v6}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    goto :goto_0

    .line 752
    :cond_5
    if-eqz v1, :cond_6

    .line 753
    const v5, 0x7f080130

    invoke-interface {p1, v7, v8, v7, v5}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 755
    :cond_6
    const v5, 0x7f080133

    invoke-interface {p1, v7, v9, v7, v5}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    goto :goto_1
.end method

.method public onProfileStateChanged(Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;I)V
    .locals 4
    .parameter "profile"
    .parameter "newProfileState"

    .prologue
    .line 116
    const-string v1, "CachedBluetoothDevice"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onProfileStateChanged: profile "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " newProfileState "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    iget-object v1, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mLocalManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;

    invoke-static {v1, p1}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->getProfileManager(Lcom/android/settings/bluetooth/LocalBluetoothManager;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;->convertState(I)I

    move-result v0

    .line 123
    .local v0, newState:I
    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 124
    iget-object v1, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 125
    iget-object v1, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 128
    :cond_0
    return-void
.end method

.method public onUuidChanged()V
    .locals 6

    .prologue
    .line 594
    invoke-direct {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->updateProfiles()Z

    .line 597
    const-string v0, "CachedBluetoothDevice"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onUuidChanged: Time since last connect"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mConnectAttempted:J

    sub-long/2addr v2, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 605
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mProfiles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-wide v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mConnectAttempted:J

    const-wide/16 v2, 0x1388

    add-long/2addr v0, v2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 608
    invoke-direct {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->connectWithoutResettingTimer()V

    .line 610
    :cond_0
    invoke-direct {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->dispatchAttributesChanged()V

    .line 611
    return-void
.end method

.method public pair()V
    .locals 5

    .prologue
    .line 346
    iget-object v1, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mLocalManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;

    invoke-virtual {v1}, Lcom/android/settings/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    .line 349
    .local v0, adapter:Landroid/bluetooth/BluetoothAdapter;
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isDiscovering()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 350
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 353
    :cond_0
    iget-object v1, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->createBond()Z

    move-result v1

    if-nez v1, :cond_1

    .line 354
    iget-object v1, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mLocalManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;

    iget-object v2, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    const v3, 0x7f080125

    const v4, 0x7f080126

    invoke-virtual {v1, v2, v3, v4}, Lcom/android/settings/bluetooth/LocalBluetoothManager;->showError(Landroid/bluetooth/BluetoothDevice;II)V

    .line 360
    :goto_0
    return-void

    .line 359
    :cond_1
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mConnectAfterPairing:Z

    goto :goto_0
.end method

.method public refresh()V
    .locals 0

    .prologue
    .line 431
    invoke-direct {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->dispatchAttributesChanged()V

    .line 432
    return-void
.end method

.method public refreshBtClass()V
    .locals 0

    .prologue
    .line 586
    invoke-direct {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->fetchBtClass()V

    .line 587
    invoke-direct {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->dispatchAttributesChanged()V

    .line 588
    return-void
.end method

.method public refreshName()V
    .locals 0

    .prologue
    .line 417
    invoke-direct {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->fetchName()V

    .line 418
    invoke-direct {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->dispatchAttributesChanged()V

    .line 419
    return-void
.end method

.method public registerCallback(Lcom/android/settings/bluetooth/CachedBluetoothDevice$Callback;)V
    .locals 2
    .parameter "callback"

    .prologue
    .line 802
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mCallbacks:Ljava/util/List;

    monitor-enter v0

    .line 803
    :try_start_0
    iget-object v1, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mCallbacks:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 804
    monitor-exit v0

    .line 805
    return-void

    .line 804
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setBtClass(Landroid/bluetooth/BluetoothClass;)V
    .locals 1
    .parameter "btClass"

    .prologue
    .line 632
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mBtClass:Landroid/bluetooth/BluetoothClass;

    if-eq v0, p1, :cond_0

    .line 633
    iput-object p1, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mBtClass:Landroid/bluetooth/BluetoothClass;

    .line 634
    invoke-direct {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->dispatchAttributesChanged()V

    .line 636
    :cond_0
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 1
    .parameter "name"

    .prologue
    .line 406
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mName:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 407
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 408
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mName:Ljava/lang/String;

    .line 412
    :goto_0
    invoke-direct {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->dispatchAttributesChanged()V

    .line 414
    :cond_0
    return-void

    .line 410
    :cond_1
    iput-object p1, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mName:Ljava/lang/String;

    goto :goto_0
.end method

.method setRssi(S)V
    .locals 1
    .parameter "rssi"

    .prologue
    .line 450
    iget-short v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mRssi:S

    if-eq v0, p1, :cond_0

    .line 451
    iput-short p1, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mRssi:S

    .line 452
    invoke-direct {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->dispatchAttributesChanged()V

    .line 454
    :cond_0
    return-void
.end method

.method setVisible(Z)V
    .locals 1
    .parameter "visible"

    .prologue
    .line 439
    iget-boolean v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mVisible:Z

    if-eq v0, p1, :cond_0

    .line 440
    iput-boolean p1, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mVisible:Z

    .line 441
    invoke-direct {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->dispatchAttributesChanged()V

    .line 443
    :cond_0
    return-void
.end method

.method public showConnectingError()V
    .locals 4

    .prologue
    .line 329
    iget-boolean v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mIsConnectingErrorPossible:Z

    if-nez v0, :cond_0

    .line 334
    :goto_0
    return-void

    .line 330
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mIsConnectingErrorPossible:Z

    .line 332
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mLocalManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;

    iget-object v1, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    const v2, 0x7f080125

    const v3, 0x7f08012a

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/settings/bluetooth/LocalBluetoothManager;->showError(Landroid/bluetooth/BluetoothDevice;II)V

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 823
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public unpair()V
    .locals 6

    .prologue
    .line 363
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->disconnect()V

    .line 365
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->getBondState()I

    move-result v1

    .line 367
    .local v1, state:I
    const/16 v3, 0xb

    if-ne v1, v3, :cond_0

    .line 368
    iget-object v3, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->cancelBondProcess()Z

    .line 371
    :cond_0
    const/16 v3, 0xa

    if-eq v1, v3, :cond_1

    .line 372
    invoke-virtual {p0}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    .line 373
    .local v0, dev:Landroid/bluetooth/BluetoothDevice;
    if-eqz v0, :cond_1

    .line 374
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->removeBond()Z

    move-result v2

    .line 375
    .local v2, successful:Z
    if-eqz v2, :cond_1

    .line 377
    const-string v3, "CachedBluetoothDevice"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Command sent successfully:REMOVE_BOND "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x0

    invoke-direct {p0, v5}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->describe(Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$Profile;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 385
    .end local v0           #dev:Landroid/bluetooth/BluetoothDevice;
    .end local v2           #successful:Z
    :cond_1
    return-void
.end method

.method public unregisterCallback(Lcom/android/settings/bluetooth/CachedBluetoothDevice$Callback;)V
    .locals 2
    .parameter "callback"

    .prologue
    .line 808
    iget-object v0, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mCallbacks:Ljava/util/List;

    monitor-enter v0

    .line 809
    :try_start_0
    iget-object v1, p0, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->mCallbacks:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 810
    monitor-exit v0

    .line 811
    return-void

    .line 810
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
