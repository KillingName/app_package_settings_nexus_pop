.class public Lcom/android/settings/widget/buttons/MobileDataButton;
.super Lcom/android/settings/widget/buttons/WidgetButton;
.source "MobileDataButton.java"


# static fields
.field public static final MOBILE_DATA_CHANGED:Ljava/lang/String; = "com.android.internal.telephony.MOBILE_DATA_CHANGED"

.field static intendedState:Ljava/lang/Boolean;

.field static ownButton:Lcom/android/settings/widget/buttons/MobileDataButton;

.field static stateChangeRequest:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 18
    sput-object v1, Lcom/android/settings/widget/buttons/MobileDataButton;->ownButton:Lcom/android/settings/widget/buttons/MobileDataButton;

    .line 20
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/settings/widget/buttons/MobileDataButton;->stateChangeRequest:Z

    .line 21
    sput-object v1, Lcom/android/settings/widget/buttons/MobileDataButton;->intendedState:Ljava/lang/Boolean;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/android/settings/widget/buttons/WidgetButton;-><init>()V

    return-void
.end method

.method public static getDataRomingEnabled(Landroid/content/Context;)Z
    .locals 3
    .parameter "context"

    .prologue
    const/4 v2, 0x0

    .line 24
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "data_roaming"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    move v0, v2

    goto :goto_0
.end method

.method private static getDataState(Landroid/content/Context;)Z
    .locals 2
    .parameter "context"

    .prologue
    .line 34
    const-string v1, "connectivity"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 36
    .local v0, cm:Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getMobileDataEnabled()Z

    move-result v1

    return v1
.end method

.method public static getInstance()Lcom/android/settings/widget/buttons/MobileDataButton;
    .locals 1

    .prologue
    .line 105
    sget-object v0, Lcom/android/settings/widget/buttons/MobileDataButton;->ownButton:Lcom/android/settings/widget/buttons/MobileDataButton;

    if-nez v0, :cond_0

    .line 106
    new-instance v0, Lcom/android/settings/widget/buttons/MobileDataButton;

    invoke-direct {v0}, Lcom/android/settings/widget/buttons/MobileDataButton;-><init>()V

    sput-object v0, Lcom/android/settings/widget/buttons/MobileDataButton;->ownButton:Lcom/android/settings/widget/buttons/MobileDataButton;

    .line 108
    :cond_0
    sget-object v0, Lcom/android/settings/widget/buttons/MobileDataButton;->ownButton:Lcom/android/settings/widget/buttons/MobileDataButton;

    return-object v0
.end method


# virtual methods
.method initButton()V
    .locals 1

    .prologue
    .line 113
    const/4 v0, 0x5

    iput v0, p0, Lcom/android/settings/widget/buttons/WidgetButton;->buttonID:I

    .line 114
    const-string v0, "toggleData"

    iput-object v0, p0, Lcom/android/settings/widget/buttons/WidgetButton;->preferenceName:Ljava/lang/String;

    .line 115
    return-void
.end method

.method public networkModeChanged(Landroid/content/Context;I)V
    .locals 3
    .parameter "context"
    .parameter "networkMode"

    .prologue
    const/4 v2, 0x1

    .line 122
    sget-boolean v1, Lcom/android/settings/widget/buttons/MobileDataButton;->stateChangeRequest:Z

    if-eqz v1, :cond_0

    .line 123
    const-string v1, "connectivity"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 125
    .local v0, cm:Landroid/net/ConnectivityManager;
    invoke-virtual {v0, v2}, Landroid/net/ConnectivityManager;->setMobileDataEnabled(Z)V

    .line 126
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    sput-object v1, Lcom/android/settings/widget/buttons/MobileDataButton;->intendedState:Ljava/lang/Boolean;

    .line 127
    const/4 v1, 0x0

    sput-boolean v1, Lcom/android/settings/widget/buttons/MobileDataButton;->stateChangeRequest:Z

    .line 129
    .end local v0           #cm:Landroid/net/ConnectivityManager;
    :cond_0
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 118
    const/4 v0, 0x0

    sput-object v0, Lcom/android/settings/widget/buttons/MobileDataButton;->intendedState:Ljava/lang/Boolean;

    .line 119
    return-void
.end method

.method public toggleState(Landroid/content/Context;)V
    .locals 6
    .parameter "context"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 44
    invoke-static {p1}, Lcom/android/settings/widget/buttons/MobileDataButton;->getDataState(Landroid/content/Context;)Z

    move-result v1

    .line 46
    .local v1, enabled:Z
    const-string v3, "widget_MAIN"

    invoke-virtual {p1, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 49
    .local v2, preferences:Landroid/content/SharedPreferences;
    const-string v3, "connectivity"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 51
    .local v0, cm:Landroid/net/ConnectivityManager;
    if-eqz v1, :cond_1

    .line 52
    invoke-virtual {v0, v4}, Landroid/net/ConnectivityManager;->setMobileDataEnabled(Z)V

    .line 53
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    sput-object v3, Lcom/android/settings/widget/buttons/MobileDataButton;->intendedState:Ljava/lang/Boolean;

    .line 54
    const-string v3, "autoDisable3G"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 55
    invoke-static {}, Lcom/android/settings/widget/buttons/NetworkModeButton;->getInstance()Lcom/android/settings/widget/buttons/NetworkModeButton;

    move-result-object v3

    invoke-virtual {v3, p1, v4}, Lcom/android/settings/widget/buttons/NetworkModeButton;->toggleState(Landroid/content/Context;I)V

    .line 70
    :cond_0
    :goto_0
    return-void

    .line 59
    :cond_1
    const-string v3, "autoEnable3G"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-static {}, Lcom/android/settings/widget/buttons/NetworkModeButton;->getInstance()Lcom/android/settings/widget/buttons/NetworkModeButton;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/android/settings/widget/buttons/NetworkModeButton;->isDisabled(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 61
    const-string v3, "MobileData: Will enable 3G first"

    invoke-static {v3}, Lcom/android/settings/widget/SettingsAppWidgetProvider;->logD(Ljava/lang/String;)V

    .line 62
    invoke-static {}, Lcom/android/settings/widget/buttons/NetworkModeButton;->getInstance()Lcom/android/settings/widget/buttons/NetworkModeButton;

    move-result-object v3

    invoke-virtual {v3, p1, v5}, Lcom/android/settings/widget/buttons/NetworkModeButton;->toggleState(Landroid/content/Context;I)V

    .line 64
    sput-boolean v5, Lcom/android/settings/widget/buttons/MobileDataButton;->stateChangeRequest:Z

    goto :goto_0

    .line 66
    :cond_2
    invoke-virtual {v0, v5}, Landroid/net/ConnectivityManager;->setMobileDataEnabled(Z)V

    .line 67
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    sput-object v3, Lcom/android/settings/widget/buttons/MobileDataButton;->intendedState:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public updateState(Landroid/content/Context;Landroid/content/SharedPreferences;[I)V
    .locals 6
    .parameter "context"
    .parameter "globalPreferences"
    .parameter "appWidgetIds"

    .prologue
    const v5, 0x7f020039

    const/16 v4, 0xa

    const/4 v2, 0x1

    const-string v3, "monitorDataRoaming"

    .line 74
    invoke-static {p1}, Lcom/android/settings/widget/buttons/MobileDataButton;->getDataState(Landroid/content/Context;)Z

    move-result v0

    .line 76
    .local v0, state:Z
    sget-boolean v1, Lcom/android/settings/widget/buttons/MobileDataButton;->stateChangeRequest:Z

    if-nez v1, :cond_0

    sget-object v1, Lcom/android/settings/widget/buttons/MobileDataButton;->intendedState:Ljava/lang/Boolean;

    if-eqz v1, :cond_2

    sget-object v1, Lcom/android/settings/widget/buttons/MobileDataButton;->intendedState:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eq v0, v1, :cond_2

    .line 77
    :cond_0
    iput v5, p0, Lcom/android/settings/widget/buttons/WidgetButton;->currentIcon:I

    .line 78
    const-string v1, "monitorDataRoaming"

    invoke-interface {p2, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {p1}, Lcom/android/settings/widget/buttons/MobileDataButton;->getDataRomingEnabled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 80
    iput v4, p0, Lcom/android/settings/widget/buttons/WidgetButton;->currentState:I

    .line 102
    :goto_0
    return-void

    .line 82
    :cond_1
    const/4 v1, 0x5

    iput v1, p0, Lcom/android/settings/widget/buttons/WidgetButton;->currentState:I

    goto :goto_0

    .line 85
    :cond_2
    if-eqz v0, :cond_4

    .line 86
    iput v5, p0, Lcom/android/settings/widget/buttons/WidgetButton;->currentIcon:I

    .line 87
    const-string v1, "monitorDataRoaming"

    invoke-interface {p2, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-static {p1}, Lcom/android/settings/widget/buttons/MobileDataButton;->getDataRomingEnabled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 89
    const/16 v1, 0xb

    iput v1, p0, Lcom/android/settings/widget/buttons/WidgetButton;->currentState:I

    goto :goto_0

    .line 91
    :cond_3
    iput v2, p0, Lcom/android/settings/widget/buttons/WidgetButton;->currentState:I

    goto :goto_0

    .line 94
    :cond_4
    const v1, 0x7f020038

    iput v1, p0, Lcom/android/settings/widget/buttons/WidgetButton;->currentIcon:I

    .line 95
    const-string v1, "monitorDataRoaming"

    invoke-interface {p2, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-static {p1}, Lcom/android/settings/widget/buttons/MobileDataButton;->getDataRomingEnabled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 97
    iput v4, p0, Lcom/android/settings/widget/buttons/WidgetButton;->currentState:I

    goto :goto_0

    .line 99
    :cond_5
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/settings/widget/buttons/WidgetButton;->currentState:I

    goto :goto_0
.end method
