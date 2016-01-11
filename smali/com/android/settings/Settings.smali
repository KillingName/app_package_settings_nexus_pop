.class public Lcom/android/settings/Settings;
.super Landroid/preference/PreferenceActivity;
.source "Settings.java"


# static fields
.field private static final KEY_CALL_SETTINGS:Ljava/lang/String; = "call_settings"

.field private static final KEY_DEVICE_SETTINGS:Ljava/lang/String; = "device_settings"

.field private static final KEY_DOCK_SETTINGS:Ljava/lang/String; = "dock_settings"

.field private static final KEY_LAUNCHER:Ljava/lang/String; = "launcher_settings"

.field private static final KEY_PARENT:Ljava/lang/String; = "parent"

.field private static final KEY_SYNC_SETTINGS:Ljava/lang/String; = "sync_settings"

.field private static final KEY_TOGGLE_BLUETOOTH:Ljava/lang/String; = "toggle_bluetooth"

.field private static final KEY_TOGGLE_WIFI:Ljava/lang/String; = "toggle_wifi"


# instance fields
.field private mBtEnabler:Lcom/android/settings/bluetooth/BluetoothEnabler;

.field private mLauncherSettings:Landroid/preference/Preference;

.field private mWifiEnabler:Lcom/android/settings/wifi/WifiEnabler;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8
    .parameter "savedInstanceState"

    .prologue
    const/4 v6, 0x0

    const-string v7, "launcher_settings"

    .line 54
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 56
    const v5, 0x7f040023

    invoke-virtual {p0, v5}, Lcom/android/settings/Settings;->addPreferencesFromResource(I)V

    .line 59
    const-string v5, "toggle_wifi"

    invoke-virtual {p0, v5}, Lcom/android/settings/Settings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Landroid/preference/CheckBoxPreference;

    .line 60
    .local v4, wifi:Landroid/preference/CheckBoxPreference;
    new-instance v5, Lcom/android/settings/wifi/WifiEnabler;

    invoke-direct {v5, p0, v4}, Lcom/android/settings/wifi/WifiEnabler;-><init>(Landroid/content/Context;Landroid/preference/CheckBoxPreference;)V

    iput-object v5, p0, Lcom/android/settings/Settings;->mWifiEnabler:Lcom/android/settings/wifi/WifiEnabler;

    .line 63
    const-string v5, "toggle_bluetooth"

    invoke-virtual {p0, v5}, Lcom/android/settings/Settings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/CheckBoxPreference;

    .line 64
    .local v1, bt:Landroid/preference/CheckBoxPreference;
    new-instance v5, Lcom/android/settings/bluetooth/BluetoothEnabler;

    invoke-direct {v5, p0, v1}, Lcom/android/settings/bluetooth/BluetoothEnabler;-><init>(Landroid/content/Context;Landroid/preference/CheckBoxPreference;)V

    iput-object v5, p0, Lcom/android/settings/Settings;->mBtEnabler:Lcom/android/settings/bluetooth/BluetoothEnabler;

    .line 66
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v5

    invoke-virtual {v5}, Landroid/telephony/TelephonyManager;->getPhoneType()I

    move-result v0

    .line 68
    .local v0, activePhoneType:I
    const-string v5, "parent"

    invoke-virtual {p0, v5}, Lcom/android/settings/Settings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/PreferenceGroup;

    .line 69
    .local v3, parent:Landroid/preference/PreferenceGroup;
    const-string v5, "sync_settings"

    invoke-static {p0, v3, v5, v6}, Lcom/android/settings/Utils;->updatePreferenceToSpecificActivityOrRemove(Landroid/content/Context;Landroid/preference/PreferenceGroup;Ljava/lang/String;I)Z

    .line 70
    const-string v5, "launcher_settings"

    invoke-static {p0, v3, v7, v6}, Lcom/android/settings/Utils;->updatePreferenceToSpecificActivityOrRemove(Landroid/content/Context;Landroid/preference/PreferenceGroup;Ljava/lang/String;I)Z

    .line 71
    const-string v5, "device_settings"

    invoke-static {p0, v3, v5, v6}, Lcom/android/settings/Utils;->updatePreferenceToSpecificActivityOrRemove(Landroid/content/Context;Landroid/preference/PreferenceGroup;Ljava/lang/String;I)Z

    .line 72
    const-string v5, "launcher_settings"

    invoke-virtual {v3, v7}, Landroid/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v5

    iput-object v5, p0, Lcom/android/settings/Settings;->mLauncherSettings:Landroid/preference/Preference;

    .line 74
    const-string v5, "dock_settings"

    invoke-virtual {v3, v5}, Landroid/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    .line 75
    .local v2, dockSettings:Landroid/preference/Preference;
    invoke-virtual {p0}, Lcom/android/settings/Settings;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f060001

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v5

    if-nez v5, :cond_0

    if-eqz v2, :cond_0

    .line 76
    invoke-virtual {v3, v2}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    .line 78
    :cond_0
    return-void
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 110
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onPause()V

    .line 111
    iget-object v0, p0, Lcom/android/settings/Settings;->mWifiEnabler:Lcom/android/settings/wifi/WifiEnabler;

    invoke-virtual {v0}, Lcom/android/settings/wifi/WifiEnabler;->pause()V

    .line 112
    iget-object v0, p0, Lcom/android/settings/Settings;->mBtEnabler:Lcom/android/settings/bluetooth/BluetoothEnabler;

    invoke-virtual {v0}, Lcom/android/settings/bluetooth/BluetoothEnabler;->pause()V

    .line 113
    return-void
.end method

.method protected onResume()V
    .locals 6

    .prologue
    const-string v5, "launcher_settings"

    .line 82
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 83
    const-string v3, "call_settings"

    invoke-virtual {p0, v3}, Lcom/android/settings/Settings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    invoke-static {p0}, Lcom/android/settings/AirplaneModeEnabler;->isAirplaneModeOn(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-static {p0}, Landroid/net/sip/SipManager;->isVoipSupported(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_2

    :cond_0
    const/4 v4, 0x1

    :goto_0
    invoke-virtual {v3, v4}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 87
    iget-object v3, p0, Lcom/android/settings/Settings;->mWifiEnabler:Lcom/android/settings/wifi/WifiEnabler;

    invoke-virtual {v3}, Lcom/android/settings/wifi/WifiEnabler;->resume()V

    .line 88
    iget-object v3, p0, Lcom/android/settings/Settings;->mBtEnabler:Lcom/android/settings/bluetooth/BluetoothEnabler;

    invoke-virtual {v3}, Lcom/android/settings/bluetooth/BluetoothEnabler;->resume()V

    .line 90
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 91
    .local v1, intent:Landroid/content/Intent;
    const-string v3, "android.intent.action.MAIN"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 92
    const-string v3, "android.intent.category.HOME"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 94
    const-string v3, "parent"

    invoke-virtual {p0, v3}, Lcom/android/settings/Settings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/PreferenceGroup;

    .line 96
    .local v2, parent:Landroid/preference/PreferenceGroup;
    invoke-virtual {p0}, Lcom/android/settings/Settings;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const/high16 v4, 0x1

    invoke-virtual {v3, v1, v4}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v3

    iget-object v0, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    .line 97
    .local v0, a:Landroid/content/pm/ActivityInfo;
    if-eqz v0, :cond_3

    iget-object v3, v0, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    const-string v4, "com.android.launcher.Launcher"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, v0, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_3

    .line 98
    const-string v3, "launcher_settings"

    invoke-virtual {v2, v5}, Landroid/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    if-nez v3, :cond_1

    .line 99
    iget-object v3, p0, Lcom/android/settings/Settings;->mLauncherSettings:Landroid/preference/Preference;

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 106
    :cond_1
    :goto_1
    return-void

    .line 83
    .end local v0           #a:Landroid/content/pm/ActivityInfo;
    .end local v1           #intent:Landroid/content/Intent;
    .end local v2           #parent:Landroid/preference/PreferenceGroup;
    :cond_2
    const/4 v4, 0x0

    goto :goto_0

    .line 102
    .restart local v0       #a:Landroid/content/pm/ActivityInfo;
    .restart local v1       #intent:Landroid/content/Intent;
    .restart local v2       #parent:Landroid/preference/PreferenceGroup;
    :cond_3
    const-string v3, "launcher_settings"

    invoke-virtual {v2, v5}, Landroid/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 103
    iget-object v3, p0, Lcom/android/settings/Settings;->mLauncherSettings:Landroid/preference/Preference;

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_1
.end method
