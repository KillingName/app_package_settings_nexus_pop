.class Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$NetworkProfileManager;
.super Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;
.source "LocalBluetoothProfileManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NetworkProfileManager"
.end annotation


# instance fields
.field private mService:Landroid/bluetooth/BluetoothNetwork;


# direct methods
.method public constructor <init>(Lcom/android/settings/bluetooth/LocalBluetoothManager;)V
    .locals 2
    .parameter "localManager"

    .prologue
    .line 682
    invoke-direct {p0, p1}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;-><init>(Lcom/android/settings/bluetooth/LocalBluetoothManager;)V

    .line 683
    new-instance v0, Landroid/bluetooth/BluetoothNetwork;

    invoke-virtual {p1}, Lcom/android/settings/bluetooth/LocalBluetoothManager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/bluetooth/BluetoothNetwork;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$NetworkProfileManager;->mService:Landroid/bluetooth/BluetoothNetwork;

    .line 684
    return-void
.end method


# virtual methods
.method public connect(Landroid/bluetooth/BluetoothDevice;)Z
    .locals 1
    .parameter "device"

    .prologue
    .line 693
    const/4 v0, 0x0

    return v0
.end method

.method public convertState(I)I
    .locals 1
    .parameter "state"

    .prologue
    .line 740
    const/4 v0, 0x0

    return v0
.end method

.method public disconnect(Landroid/bluetooth/BluetoothDevice;)Z
    .locals 1
    .parameter "device"

    .prologue
    .line 698
    const/4 v0, 0x0

    return v0
.end method

.method public getConnectedDevices()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Landroid/bluetooth/BluetoothDevice;",
            ">;"
        }
    .end annotation

    .prologue
    .line 688
    const/4 v0, 0x0

    return-object v0
.end method

.method public getConnectionStatus(Landroid/bluetooth/BluetoothDevice;)I
    .locals 1
    .parameter "device"

    .prologue
    .line 703
    const/4 v0, 0x0

    return v0
.end method

.method public getPreferred(Landroid/bluetooth/BluetoothDevice;)I
    .locals 1
    .parameter "device"

    .prologue
    .line 724
    const/4 v0, 0x0

    return v0
.end method

.method public getSummary(Landroid/bluetooth/BluetoothDevice;)I
    .locals 2
    .parameter "device"

    .prologue
    .line 708
    invoke-virtual {p0, p1}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$NetworkProfileManager;->getConnectionStatus(Landroid/bluetooth/BluetoothDevice;)I

    move-result v0

    .line 710
    .local v0, connectionStatus:I
    invoke-static {v0}, Lcom/android/settings/bluetooth/SettingsBtStatus;->isConnectionStatusConnected(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 711
    const v1, 0x7f080144

    .line 713
    :goto_0
    return v1

    :cond_0
    invoke-static {v0}, Lcom/android/settings/bluetooth/SettingsBtStatus;->getConnectionStatusSummary(I)I

    move-result v1

    goto :goto_0
.end method

.method public isPreferred(Landroid/bluetooth/BluetoothDevice;)Z
    .locals 1
    .parameter "device"

    .prologue
    .line 719
    const/4 v0, 0x0

    return v0
.end method

.method public isProfileReady()Z
    .locals 1

    .prologue
    .line 735
    const/4 v0, 0x1

    return v0
.end method

.method public setPreferred(Landroid/bluetooth/BluetoothDevice;Z)V
    .locals 0
    .parameter "device"
    .parameter "preferred"

    .prologue
    .line 730
    return-void
.end method
