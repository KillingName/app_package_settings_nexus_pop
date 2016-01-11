.class public Lcom/android/settings/bluetooth/BluetoothPairingRequest;
.super Landroid/content/BroadcastReceiver;
.source "BluetoothPairingRequest.java"


# static fields
.field public static final NOTIFICATION_ID:I = 0x1080080


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 22
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 44
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    .line 45
    .local v5, action:Ljava/lang/String;
    const-string v18, "android.bluetooth.device.action.PAIRING_REQUEST"

    move-object v0, v5

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_6

    .line 47
    invoke-static/range {p1 .. p1}, Lcom/android/settings/bluetooth/LocalBluetoothManager;->getInstance(Landroid/content/Context;)Lcom/android/settings/bluetooth/LocalBluetoothManager;

    move-result-object v8

    .line 49
    .local v8, localManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;
    const-string v18, "android.bluetooth.device.extra.DEVICE"

    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v6

    check-cast v6, Landroid/bluetooth/BluetoothDevice;

    .line 51
    .local v6, device:Landroid/bluetooth/BluetoothDevice;
    const-string v18, "android.bluetooth.device.extra.PAIRING_VARIANT"

    const/high16 v19, -0x8000

    move-object/from16 v0, p2

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v17

    .line 53
    .local v17, type:I
    new-instance v12, Landroid/content/Intent;

    invoke-direct {v12}, Landroid/content/Intent;-><init>()V

    .line 54
    .local v12, pairingIntent:Landroid/content/Intent;
    const-class v18, Lcom/android/settings/bluetooth/BluetoothPairingDialog;

    move-object v0, v12

    move-object/from16 v1, p1

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 55
    const-string v18, "android.bluetooth.device.extra.DEVICE"

    move-object v0, v12

    move-object/from16 v1, v18

    move-object v2, v6

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 56
    const-string v18, "android.bluetooth.device.extra.PAIRING_VARIANT"

    move-object v0, v12

    move-object/from16 v1, v18

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 57
    const/16 v18, 0x2

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_0

    const/16 v18, 0x4

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_1

    .line 59
    :cond_0
    const-string v18, "android.bluetooth.device.extra.PASSKEY"

    const/high16 v19, -0x8000

    move-object/from16 v0, p2

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v13

    .line 60
    .local v13, passkey:I
    const-string v18, "android.bluetooth.device.extra.PASSKEY"

    move-object v0, v12

    move-object/from16 v1, v18

    move v2, v13

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 62
    .end local v13           #passkey:I
    :cond_1
    const-string v18, "android.bluetooth.device.action.PAIRING_REQUEST"

    move-object v0, v12

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 63
    const/high16 v18, 0x1000

    move-object v0, v12

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 65
    const-string v18, "power"

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/os/PowerManager;

    .line 67
    .local v15, powerManager:Landroid/os/PowerManager;
    if-eqz v6, :cond_3

    invoke-virtual {v6}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v7, v18

    .line 68
    .local v7, deviceAddress:Ljava/lang/String;
    :goto_0
    invoke-virtual {v15}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v18

    if-eqz v18, :cond_4

    invoke-virtual {v8, v7}, Lcom/android/settings/bluetooth/LocalBluetoothManager;->shouldShowDialogInForeground(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_4

    .line 72
    move-object/from16 v0, p1

    move-object v1, v12

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 110
    .end local v6           #device:Landroid/bluetooth/BluetoothDevice;
    .end local v7           #deviceAddress:Ljava/lang/String;
    .end local v8           #localManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;
    .end local v12           #pairingIntent:Landroid/content/Intent;
    .end local v15           #powerManager:Landroid/os/PowerManager;
    .end local v17           #type:I
    :cond_2
    :goto_1
    return-void

    .line 67
    .restart local v6       #device:Landroid/bluetooth/BluetoothDevice;
    .restart local v8       #localManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;
    .restart local v12       #pairingIntent:Landroid/content/Intent;
    .restart local v15       #powerManager:Landroid/os/PowerManager;
    .restart local v17       #type:I
    :cond_3
    const/16 v18, 0x0

    move-object/from16 v7, v18

    goto :goto_0

    .line 77
    .restart local v7       #deviceAddress:Ljava/lang/String;
    :cond_4
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v16

    .line 78
    .local v16, res:Landroid/content/res/Resources;
    new-instance v11, Landroid/app/Notification;

    const v18, 0x1080080

    const v19, 0x7f080062

    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v19

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    move-object v0, v11

    move/from16 v1, v18

    move-object/from16 v2, v19

    move-wide/from16 v3, v20

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 83
    .local v11, notification:Landroid/app/Notification;
    const/16 v18, 0x0

    const/high16 v19, 0x4000

    move-object/from16 v0, p1

    move/from16 v1, v18

    move-object v2, v12

    move/from16 v3, v19

    invoke-static {v0, v1, v2, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v14

    .line 86
    .local v14, pending:Landroid/app/PendingIntent;
    const-string v18, "android.bluetooth.device.extra.NAME"

    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 87
    .local v10, name:Ljava/lang/String;
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v18

    if-eqz v18, :cond_5

    .line 88
    invoke-virtual {v6}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v10

    .line 91
    :cond_5
    const v18, 0x7f080063

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v18

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const v20, 0x7f080064

    move-object/from16 v0, v16

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object v1, v10

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object v0, v11

    move-object/from16 v1, p1

    move-object/from16 v2, v18

    move-object/from16 v3, v19

    move-object v4, v14

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 95
    move-object v0, v11

    iget v0, v0, Landroid/app/Notification;->flags:I

    move/from16 v18, v0

    or-int/lit8 v18, v18, 0x10

    move/from16 v0, v18

    move-object v1, v11

    iput v0, v1, Landroid/app/Notification;->flags:I

    .line 96
    move-object v0, v11

    iget v0, v0, Landroid/app/Notification;->defaults:I

    move/from16 v18, v0

    or-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object v1, v11

    iput v0, v1, Landroid/app/Notification;->defaults:I

    .line 98
    const-string v18, "notification"

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/app/NotificationManager;

    .line 100
    .local v9, manager:Landroid/app/NotificationManager;
    const v18, 0x1080080

    move-object v0, v9

    move/from16 v1, v18

    move-object v2, v11

    invoke-virtual {v0, v1, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto/16 :goto_1

    .line 103
    .end local v6           #device:Landroid/bluetooth/BluetoothDevice;
    .end local v7           #deviceAddress:Ljava/lang/String;
    .end local v8           #localManager:Lcom/android/settings/bluetooth/LocalBluetoothManager;
    .end local v9           #manager:Landroid/app/NotificationManager;
    .end local v10           #name:Ljava/lang/String;
    .end local v11           #notification:Landroid/app/Notification;
    .end local v12           #pairingIntent:Landroid/content/Intent;
    .end local v14           #pending:Landroid/app/PendingIntent;
    .end local v15           #powerManager:Landroid/os/PowerManager;
    .end local v16           #res:Landroid/content/res/Resources;
    .end local v17           #type:I
    :cond_6
    const-string v18, "android.bluetooth.device.action.PAIRING_CANCEL"

    move-object v0, v5

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_2

    .line 106
    const-string v18, "notification"

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/app/NotificationManager;

    .line 108
    .restart local v9       #manager:Landroid/app/NotificationManager;
    const v18, 0x1080080

    move-object v0, v9

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    goto/16 :goto_1
.end method
