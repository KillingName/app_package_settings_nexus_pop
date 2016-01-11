.class Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$HIDProfileManager;
.super Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;
.source "LocalBluetoothProfileManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "HIDProfileManager"
.end annotation


# instance fields
.field private mService:Landroid/bluetooth/BluetoothHid;


# direct methods
.method public constructor <init>(Lcom/android/settings/bluetooth/LocalBluetoothManager;)V
    .locals 2
    .parameter "localManager"

    .prologue
    .line 593
    invoke-direct {p0, p1}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;-><init>(Lcom/android/settings/bluetooth/LocalBluetoothManager;)V

    .line 594
    new-instance v0, Landroid/bluetooth/BluetoothHid;

    invoke-virtual {p1}, Lcom/android/settings/bluetooth/LocalBluetoothManager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/bluetooth/BluetoothHid;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$HIDProfileManager;->mService:Landroid/bluetooth/BluetoothHid;

    .line 595
    return-void
.end method


# virtual methods
.method public connect(Landroid/bluetooth/BluetoothDevice;)Z
    .locals 4
    .parameter "device"

    .prologue
    .line 604
    iget-object v3, p0, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$HIDProfileManager;->mService:Landroid/bluetooth/BluetoothHid;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothHid;->getNonDisconnectedSinks()Ljava/util/Set;

    move-result-object v2

    .line 605
    .local v2, sinks:Ljava/util/Set;,"Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    if-eqz v2, :cond_0

    .line 606
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/bluetooth/BluetoothDevice;

    .line 607
    .local v1, sink:Landroid/bluetooth/BluetoothDevice;
    iget-object v3, p0, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$HIDProfileManager;->mService:Landroid/bluetooth/BluetoothHid;

    invoke-virtual {v3, p1}, Landroid/bluetooth/BluetoothHid;->disconnectHidDevice(Landroid/bluetooth/BluetoothDevice;)Z

    goto :goto_0

    .line 611
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #sink:Landroid/bluetooth/BluetoothDevice;
    :cond_0
    iget-object v3, p0, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$HIDProfileManager;->mService:Landroid/bluetooth/BluetoothHid;

    invoke-virtual {v3, p1}, Landroid/bluetooth/BluetoothHid;->connectHidDevice(Landroid/bluetooth/BluetoothDevice;)Z

    move-result v3

    return v3
.end method

.method public convertState(I)I
    .locals 1
    .parameter "hidState"

    .prologue
    .line 663
    packed-switch p1, :pswitch_data_0

    .line 673
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 665
    :pswitch_0
    const/4 v0, 0x2

    goto :goto_0

    .line 667
    :pswitch_1
    const/4 v0, 0x3

    goto :goto_0

    .line 669
    :pswitch_2
    const/4 v0, 0x4

    goto :goto_0

    .line 671
    :pswitch_3
    const/4 v0, 0x5

    goto :goto_0

    .line 663
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method public disconnect(Landroid/bluetooth/BluetoothDevice;)Z
    .locals 1
    .parameter "device"

    .prologue
    .line 616
    iget-object v0, p0, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$HIDProfileManager;->mService:Landroid/bluetooth/BluetoothHid;

    invoke-virtual {v0, p1}, Landroid/bluetooth/BluetoothHid;->disconnectHidDevice(Landroid/bluetooth/BluetoothDevice;)Z

    move-result v0

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
    .line 599
    iget-object v0, p0, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$HIDProfileManager;->mService:Landroid/bluetooth/BluetoothHid;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothHid;->getNonDisconnectedSinks()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getConnectionStatus(Landroid/bluetooth/BluetoothDevice;)I
    .locals 1
    .parameter "device"

    .prologue
    .line 621
    iget-object v0, p0, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$HIDProfileManager;->mService:Landroid/bluetooth/BluetoothHid;

    invoke-virtual {v0, p1}, Landroid/bluetooth/BluetoothHid;->getHidDeviceState(Landroid/bluetooth/BluetoothDevice;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$HIDProfileManager;->convertState(I)I

    move-result v0

    return v0
.end method

.method public getPreferred(Landroid/bluetooth/BluetoothDevice;)I
    .locals 1
    .parameter "device"

    .prologue
    .line 642
    iget-object v0, p0, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$HIDProfileManager;->mService:Landroid/bluetooth/BluetoothHid;

    invoke-virtual {v0, p1}, Landroid/bluetooth/BluetoothHid;->getHidDevicePriority(Landroid/bluetooth/BluetoothDevice;)I

    move-result v0

    return v0
.end method

.method public getSummary(Landroid/bluetooth/BluetoothDevice;)I
    .locals 2
    .parameter "device"

    .prologue
    .line 626
    invoke-virtual {p0, p1}, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$HIDProfileManager;->getConnectionStatus(Landroid/bluetooth/BluetoothDevice;)I

    move-result v0

    .line 628
    .local v0, connectionStatus:I
    invoke-static {v0}, Lcom/android/settings/bluetooth/SettingsBtStatus;->isConnectionStatusConnected(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 629
    const v1, 0x7f08014b

    .line 631
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
    .line 638
    iget-object v0, p0, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$HIDProfileManager;->mService:Landroid/bluetooth/BluetoothHid;

    invoke-virtual {v0, p1}, Landroid/bluetooth/BluetoothHid;->getHidDevicePriority(Landroid/bluetooth/BluetoothDevice;)I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isProfileReady()Z
    .locals 1

    .prologue
    .line 658
    const/4 v0, 0x1

    return v0
.end method

.method public setPreferred(Landroid/bluetooth/BluetoothDevice;Z)V
    .locals 2
    .parameter "device"
    .parameter "preferred"

    .prologue
    const/16 v1, 0x64

    .line 647
    if-eqz p2, :cond_1

    .line 648
    iget-object v0, p0, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$HIDProfileManager;->mService:Landroid/bluetooth/BluetoothHid;

    invoke-virtual {v0, p1}, Landroid/bluetooth/BluetoothHid;->getHidDevicePriority(Landroid/bluetooth/BluetoothDevice;)I

    move-result v0

    if-ge v0, v1, :cond_0

    .line 649
    iget-object v0, p0, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$HIDProfileManager;->mService:Landroid/bluetooth/BluetoothHid;

    invoke-virtual {v0, p1, v1}, Landroid/bluetooth/BluetoothHid;->setHidDevicePriority(Landroid/bluetooth/BluetoothDevice;I)Z

    .line 654
    :cond_0
    :goto_0
    return-void

    .line 652
    :cond_1
    iget-object v0, p0, Lcom/android/settings/bluetooth/LocalBluetoothProfileManager$HIDProfileManager;->mService:Landroid/bluetooth/BluetoothHid;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/bluetooth/BluetoothHid;->setHidDevicePriority(Landroid/bluetooth/BluetoothDevice;I)Z

    goto :goto_0
.end method
