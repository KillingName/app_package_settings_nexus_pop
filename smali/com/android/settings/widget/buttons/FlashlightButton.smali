.class public Lcom/android/settings/widget/buttons/FlashlightButton;
.super Lcom/android/settings/widget/buttons/WidgetButton;
.source "FlashlightButton.java"


# static fields
.field static ownButton:Lcom/android/settings/widget/buttons/FlashlightButton;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const/4 v0, 0x0

    sput-object v0, Lcom/android/settings/widget/buttons/FlashlightButton;->ownButton:Lcom/android/settings/widget/buttons/FlashlightButton;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/android/settings/widget/buttons/WidgetButton;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/android/settings/widget/buttons/FlashlightButton;
    .locals 1

    .prologue
    .line 47
    sget-object v0, Lcom/android/settings/widget/buttons/FlashlightButton;->ownButton:Lcom/android/settings/widget/buttons/FlashlightButton;

    if-nez v0, :cond_0

    .line 48
    new-instance v0, Lcom/android/settings/widget/buttons/FlashlightButton;

    invoke-direct {v0}, Lcom/android/settings/widget/buttons/FlashlightButton;-><init>()V

    sput-object v0, Lcom/android/settings/widget/buttons/FlashlightButton;->ownButton:Lcom/android/settings/widget/buttons/FlashlightButton;

    .line 49
    :cond_0
    sget-object v0, Lcom/android/settings/widget/buttons/FlashlightButton;->ownButton:Lcom/android/settings/widget/buttons/FlashlightButton;

    return-object v0
.end method


# virtual methods
.method public getFlashlightEnabled(Landroid/content/Context;)Z
    .locals 4
    .parameter "context"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 53
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "torch_state"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v3, :cond_0

    move v0, v3

    :goto_0
    return v0

    :cond_0
    move v0, v2

    goto :goto_0
.end method

.method initButton()V
    .locals 1

    .prologue
    .line 59
    const/16 v0, 0xa

    iput v0, p0, Lcom/android/settings/widget/buttons/WidgetButton;->buttonID:I

    .line 60
    const-string v0, "toggleFlashlight"

    iput-object v0, p0, Lcom/android/settings/widget/buttons/WidgetButton;->preferenceName:Ljava/lang/String;

    .line 61
    return-void
.end method

.method public toggleState(Landroid/content/Context;)V
    .locals 6
    .parameter "context"

    .prologue
    const-string v5, "net.cactii.flash2.TOGGLE_FLASHLIGHT"

    .line 33
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 34
    .local v2, pm:Landroid/content/pm/PackageManager;
    new-instance v3, Landroid/content/Intent;

    const-string v4, "net.cactii.flash2.TOGGLE_FLASHLIGHT"

    invoke-direct {v3, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->queryBroadcastReceivers(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    .line 36
    .local v1, l:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 37
    new-instance v3, Landroid/content/Intent;

    const-string v4, "net.cactii.flash2.TOGGLE_FLASHLIGHT"

    invoke-direct {v3, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 44
    :goto_0
    return-void

    .line 39
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-class v3, Lcom/android/settings/widget/FlashlightActivity;

    invoke-direct {v0, p1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 40
    .local v0, intent:Landroid/content/Intent;
    const/high16 v3, 0x4000

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 41
    const/high16 v3, 0x1000

    invoke-virtual {v0, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 42
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public updateState(Landroid/content/Context;Landroid/content/SharedPreferences;[I)V
    .locals 1
    .parameter "context"
    .parameter "globalPreferences"
    .parameter "appWidgetIds"

    .prologue
    .line 23
    invoke-virtual {p0, p1}, Lcom/android/settings/widget/buttons/FlashlightButton;->getFlashlightEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 24
    const v0, 0x7f02003b

    iput v0, p0, Lcom/android/settings/widget/buttons/WidgetButton;->currentIcon:I

    .line 25
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/settings/widget/buttons/WidgetButton;->currentState:I

    .line 30
    :goto_0
    return-void

    .line 27
    :cond_0
    const v0, 0x7f02003a

    iput v0, p0, Lcom/android/settings/widget/buttons/WidgetButton;->currentIcon:I

    .line 28
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/settings/widget/buttons/WidgetButton;->currentState:I

    goto :goto_0
.end method
