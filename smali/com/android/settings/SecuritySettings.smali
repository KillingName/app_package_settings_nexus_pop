.class public Lcom/android/settings/SecuritySettings;
.super Landroid/preference/PreferenceActivity;
.source "SecuritySettings.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/settings/SecuritySettings$CredentialStorage;,
        Lcom/android/settings/SecuritySettings$SettingsObserver;
    }
.end annotation


# static fields
.field private static final ASSISTED_GPS:Ljava/lang/String; = "assisted_gps"

.field public static final GPS_STATUS_CHANGED:Ljava/lang/String; = "com.android.settings.GPS_STATUS_CHANGED"

.field private static final ICC_LOCK_SETTINGS:Ljava/lang/String; = "com.android.settings.IccLockSettings"

.field private static final KEY_LOCK_ENABLED:Ljava/lang/String; = "lockenabled"

.field private static final KEY_SHOW_ERROR_PATH:Ljava/lang/String; = "show_error_path"

.field private static final KEY_START_DATABASE_ADMINISTRATION:Ljava/lang/String; = "start_database_administration"

.field private static final KEY_TACTILE_FEEDBACK_ENABLED:Ljava/lang/String; = "unlock_tactile_feedback"

.field private static final KEY_UNLOCK_SET_OR_CHANGE:Ljava/lang/String; = "unlock_set_or_change"

.field private static final KEY_VISIBLE_PATTERN:Ljava/lang/String; = "visiblepattern"

.field private static final LOCATION_GPS:Ljava/lang/String; = "location_gps"

.field private static final LOCATION_NETWORK:Ljava/lang/String; = "location_network"

.field private static final PACKAGE:Ljava/lang/String; = "com.android.settings"

.field private static final PROPERTY_EFS_ENABLED:Ljava/lang/String; = "persist.security.efs.enabled"

.field private static final PROPERTY_EFS_TRANSITION:Ljava/lang/String; = "persist.security.efs.trans"

.field private static final SET_OR_CHANGE_LOCK_METHOD_REQUEST:I = 0x7b

.field private static final TSM_RESULT:I = 0xc3


# instance fields
.field private mAssistedGps:Landroid/preference/CheckBoxPreference;

.field private mChooseLockSettingsHelper:Lcom/android/settings/ChooseLockSettingsHelper;

.field private mContentQueryMap:Landroid/content/ContentQueryMap;

.field private mCredentialStorage:Lcom/android/settings/SecuritySettings$CredentialStorage;

.field mDPM:Landroid/app/admin/DevicePolicyManager;

.field private mEncryptedFSEnabled:Landroid/preference/CheckBoxPreference;

.field private mGps:Landroid/preference/CheckBoxPreference;

.field private mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

.field private mNetwork:Landroid/preference/CheckBoxPreference;

.field private mShowErrorPath:Landroid/preference/CheckBoxPreference;

.field private mShowPassword:Landroid/preference/CheckBoxPreference;

.field private mStartDatabaseAdministration:Landroid/preference/Preference;

.field private mTactileFeedback:Landroid/preference/CheckBoxPreference;

.field private mVisiblePattern:Landroid/preference/CheckBoxPreference;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 63
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 98
    new-instance v0, Lcom/android/settings/SecuritySettings$CredentialStorage;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/settings/SecuritySettings$CredentialStorage;-><init>(Lcom/android/settings/SecuritySettings;Lcom/android/settings/SecuritySettings$1;)V

    iput-object v0, p0, Lcom/android/settings/SecuritySettings;->mCredentialStorage:Lcom/android/settings/SecuritySettings$CredentialStorage;

    .line 454
    return-void
.end method

.method static synthetic access$100(Lcom/android/settings/SecuritySettings;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 63
    invoke-direct {p0}, Lcom/android/settings/SecuritySettings;->updateToggles()V

    return-void
.end method

.method private createPreferenceHierarchy()Landroid/preference/PreferenceScreen;
    .locals 15

    .prologue
    .line 200
    invoke-virtual {p0}, Lcom/android/settings/SecuritySettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v8

    .line 201
    .local v8, root:Landroid/preference/PreferenceScreen;
    if-eqz v8, :cond_0

    .line 202
    invoke-virtual {v8}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 204
    :cond_0
    const v12, 0x7f04001c

    invoke-virtual {p0, v12}, Lcom/android/settings/SecuritySettings;->addPreferencesFromResource(I)V

    .line 205
    invoke-virtual {p0}, Lcom/android/settings/SecuritySettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v8

    .line 207
    invoke-virtual {p0}, Lcom/android/settings/SecuritySettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v12

    const-string v13, "location_network"

    invoke-virtual {v12, v13}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    iput-object v0, p0, Lcom/android/settings/SecuritySettings;->mNetwork:Landroid/preference/CheckBoxPreference;

    .line 208
    invoke-virtual {p0}, Lcom/android/settings/SecuritySettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v12

    const-string v13, "location_gps"

    invoke-virtual {v12, v13}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    iput-object v0, p0, Lcom/android/settings/SecuritySettings;->mGps:Landroid/preference/CheckBoxPreference;

    .line 209
    invoke-virtual {p0}, Lcom/android/settings/SecuritySettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v12

    const-string v13, "assisted_gps"

    invoke-virtual {v12, v13}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    iput-object v0, p0, Lcom/android/settings/SecuritySettings;->mAssistedGps:Landroid/preference/CheckBoxPreference;

    .line 211
    invoke-virtual {p0}, Lcom/android/settings/SecuritySettings;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v7

    .line 214
    .local v7, pm:Landroid/preference/PreferenceManager;
    iget-object v12, p0, Lcom/android/settings/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {v12}, Lcom/android/internal/widget/LockPatternUtils;->isSecure()Z

    move-result v12

    if-nez v12, :cond_2

    .line 215
    const v12, 0x7f04001d

    invoke-virtual {p0, v12}, Lcom/android/settings/SecuritySettings;->addPreferencesFromResource(I)V

    .line 238
    :goto_0
    const-string v12, "visiblepattern"

    invoke-virtual {v7, v12}, Landroid/preference/PreferenceManager;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    iput-object v0, p0, Lcom/android/settings/SecuritySettings;->mVisiblePattern:Landroid/preference/CheckBoxPreference;

    .line 241
    const-string v12, "show_error_path"

    invoke-virtual {v7, v12}, Landroid/preference/PreferenceManager;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    iput-object v0, p0, Lcom/android/settings/SecuritySettings;->mShowErrorPath:Landroid/preference/CheckBoxPreference;

    .line 244
    const-string v12, "unlock_tactile_feedback"

    invoke-virtual {v7, v12}, Landroid/preference/PreferenceManager;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    iput-object v0, p0, Lcom/android/settings/SecuritySettings;->mTactileFeedback:Landroid/preference/CheckBoxPreference;

    .line 246
    const-string v12, "start_database_administration"

    invoke-virtual {p0, v12}, Lcom/android/settings/SecuritySettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v12

    iput-object v12, p0, Lcom/android/settings/SecuritySettings;->mStartDatabaseAdministration:Landroid/preference/Preference;

    .line 248
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v12

    invoke-virtual {v12}, Landroid/telephony/TelephonyManager;->getPhoneType()I

    move-result v0

    .line 251
    .local v0, activePhoneType:I
    const/4 v12, 0x2

    if-eq v12, v0, :cond_1

    .line 253
    invoke-virtual {p0}, Lcom/android/settings/SecuritySettings;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v12

    invoke-virtual {v12, p0}, Landroid/preference/PreferenceManager;->createPreferenceScreen(Landroid/content/Context;)Landroid/preference/PreferenceScreen;

    move-result-object v11

    .line 255
    .local v11, simLockPreferences:Landroid/preference/PreferenceScreen;
    const v12, 0x7f08020c

    invoke-virtual {v11, v12}, Landroid/preference/PreferenceScreen;->setTitle(I)V

    .line 257
    new-instance v12, Landroid/content/Intent;

    invoke-direct {v12}, Landroid/content/Intent;-><init>()V

    const-string v13, "com.android.settings"

    const-string v14, "com.android.settings.IccLockSettings"

    invoke-virtual {v12, v13, v14}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v12

    invoke-virtual {v11, v12}, Landroid/preference/PreferenceScreen;->setIntent(Landroid/content/Intent;)V

    .line 258
    new-instance v10, Landroid/preference/PreferenceCategory;

    invoke-direct {v10, p0}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V

    .line 259
    .local v10, simLockCat:Landroid/preference/PreferenceCategory;
    const v12, 0x7f08020d

    invoke-virtual {v10, v12}, Landroid/preference/PreferenceCategory;->setTitle(I)V

    .line 260
    invoke-virtual {v8, v10}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 261
    invoke-virtual {v10, v11}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 265
    .end local v10           #simLockCat:Landroid/preference/PreferenceCategory;
    .end local v11           #simLockPreferences:Landroid/preference/PreferenceScreen;
    :cond_1
    new-instance v6, Landroid/preference/PreferenceCategory;

    invoke-direct {v6, p0}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V

    .line 266
    .local v6, passwordsCat:Landroid/preference/PreferenceCategory;
    const v12, 0x7f0800f0

    invoke-virtual {v6, v12}, Landroid/preference/PreferenceCategory;->setTitle(I)V

    .line 267
    invoke-virtual {v8, v6}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 269
    new-instance v9, Landroid/preference/CheckBoxPreference;

    invoke-direct {v9, p0}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    iput-object v9, p0, Lcom/android/settings/SecuritySettings;->mShowPassword:Landroid/preference/CheckBoxPreference;

    .line 270
    .local v9, showPassword:Landroid/preference/CheckBoxPreference;
    const-string v12, "show_password"

    invoke-virtual {v9, v12}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    .line 271
    const v12, 0x7f080368

    invoke-virtual {v9, v12}, Landroid/preference/CheckBoxPreference;->setTitle(I)V

    .line 272
    const v12, 0x7f080369

    invoke-virtual {v9, v12}, Landroid/preference/CheckBoxPreference;->setSummary(I)V

    .line 273
    const/4 v12, 0x0

    invoke-virtual {v9, v12}, Landroid/preference/CheckBoxPreference;->setPersistent(Z)V

    .line 274
    invoke-virtual {v6, v9}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 277
    new-instance v4, Landroid/preference/PreferenceCategory;

    invoke-direct {v4, p0}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V

    .line 278
    .local v4, devicePoliciesCat:Landroid/preference/PreferenceCategory;
    const v12, 0x7f080113

    invoke-virtual {v4, v12}, Landroid/preference/PreferenceCategory;->setTitle(I)V

    .line 279
    invoke-virtual {v8, v4}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 281
    new-instance v2, Landroid/preference/Preference;

    invoke-direct {v2, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 282
    .local v2, deviceAdminButton:Landroid/preference/Preference;
    const v12, 0x7f080114

    invoke-virtual {v2, v12}, Landroid/preference/Preference;->setTitle(I)V

    .line 283
    const v12, 0x7f080115

    invoke-virtual {v2, v12}, Landroid/preference/Preference;->setSummary(I)V

    .line 284
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 285
    .local v3, deviceAdminIntent:Landroid/content/Intent;
    const-class v12, Lcom/android/settings/DeviceAdminSettings;

    invoke-virtual {v3, p0, v12}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 286
    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setIntent(Landroid/content/Intent;)V

    .line 287
    invoke-virtual {v4, v2}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 290
    new-instance v1, Landroid/preference/PreferenceCategory;

    invoke-direct {v1, p0}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V

    .line 291
    .local v1, credentialsCat:Landroid/preference/PreferenceCategory;
    const v12, 0x7f0804ae

    invoke-virtual {v1, v12}, Landroid/preference/PreferenceCategory;->setTitle(I)V

    .line 292
    invoke-virtual {v8, v1}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 293
    iget-object v12, p0, Lcom/android/settings/SecuritySettings;->mCredentialStorage:Lcom/android/settings/SecuritySettings$CredentialStorage;

    const/4 v13, 0x0

    #calls: Lcom/android/settings/SecuritySettings$CredentialStorage;->createPreferences(Landroid/preference/PreferenceCategory;I)V
    invoke-static {v12, v1, v13}, Lcom/android/settings/SecuritySettings$CredentialStorage;->access$300(Lcom/android/settings/SecuritySettings$CredentialStorage;Landroid/preference/PreferenceCategory;I)V

    .line 296
    new-instance v5, Landroid/preference/PreferenceCategory;

    invoke-direct {v5, p0}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V

    .line 297
    .local v5, encryptedfsCat:Landroid/preference/PreferenceCategory;
    const v12, 0x7f0804c8

    invoke-virtual {v5, v12}, Landroid/preference/PreferenceCategory;->setTitle(I)V

    .line 299
    iget-object v12, p0, Lcom/android/settings/SecuritySettings;->mCredentialStorage:Lcom/android/settings/SecuritySettings$CredentialStorage;

    const/4 v13, 0x1

    #calls: Lcom/android/settings/SecuritySettings$CredentialStorage;->createPreferences(Landroid/preference/PreferenceCategory;I)V
    invoke-static {v12, v5, v13}, Lcom/android/settings/SecuritySettings$CredentialStorage;->access$300(Lcom/android/settings/SecuritySettings$CredentialStorage;Landroid/preference/PreferenceCategory;I)V

    .line 300
    return-object v8

    .line 217
    .end local v0           #activePhoneType:I
    .end local v1           #credentialsCat:Landroid/preference/PreferenceCategory;
    .end local v2           #deviceAdminButton:Landroid/preference/Preference;
    .end local v3           #deviceAdminIntent:Landroid/content/Intent;
    .end local v4           #devicePoliciesCat:Landroid/preference/PreferenceCategory;
    .end local v5           #encryptedfsCat:Landroid/preference/PreferenceCategory;
    .end local v6           #passwordsCat:Landroid/preference/PreferenceCategory;
    .end local v9           #showPassword:Landroid/preference/CheckBoxPreference;
    :cond_2
    iget-object v12, p0, Lcom/android/settings/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {v12}, Lcom/android/internal/widget/LockPatternUtils;->getKeyguardStoredPasswordQuality()I

    move-result v12

    sparse-switch v12, :sswitch_data_0

    goto/16 :goto_0

    .line 219
    :sswitch_0
    const v12, 0x7f040020

    invoke-virtual {p0, v12}, Lcom/android/settings/SecuritySettings;->addPreferencesFromResource(I)V

    goto/16 :goto_0

    .line 222
    :sswitch_1
    const v12, 0x7f04001e

    invoke-virtual {p0, v12}, Lcom/android/settings/SecuritySettings;->addPreferencesFromResource(I)V

    goto/16 :goto_0

    .line 225
    :sswitch_2
    const v12, 0x7f040022

    invoke-virtual {p0, v12}, Lcom/android/settings/SecuritySettings;->addPreferencesFromResource(I)V

    goto/16 :goto_0

    .line 229
    :sswitch_3
    const v12, 0x7f04001f

    invoke-virtual {p0, v12}, Lcom/android/settings/SecuritySettings;->addPreferencesFromResource(I)V

    goto/16 :goto_0

    .line 217
    :sswitch_data_0
    .sparse-switch
        0x10000 -> :sswitch_0
        0x1ffff -> :sswitch_1
        0x20000 -> :sswitch_2
        0x40000 -> :sswitch_3
        0x50000 -> :sswitch_3
    .end sparse-switch
.end method

.method private isToggled(Landroid/preference/Preference;)Z
    .locals 1
    .parameter "pref"

    .prologue
    .line 401
    check-cast p1, Landroid/preference/CheckBoxPreference;

    .end local p1
    invoke-virtual {p1}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    return v0
.end method

.method private toast(Ljava/lang/String;)V
    .locals 1
    .parameter "s"

    .prologue
    .line 408
    new-instance v0, Lcom/android/settings/SecuritySettings$2;

    invoke-direct {v0, p0, p1}, Lcom/android/settings/SecuritySettings$2;-><init>(Lcom/android/settings/SecuritySettings;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/android/settings/SecuritySettings;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 414
    return-void
.end method

.method private updateToggles()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 387
    invoke-virtual {p0}, Lcom/android/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 388
    .local v1, res:Landroid/content/ContentResolver;
    const-string v2, "gps"

    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->isLocationProviderEnabled(Landroid/content/ContentResolver;Ljava/lang/String;)Z

    move-result v0

    .line 390
    .local v0, gpsEnabled:Z
    iget-object v2, p0, Lcom/android/settings/SecuritySettings;->mNetwork:Landroid/preference/CheckBoxPreference;

    const-string v3, "network"

    invoke-static {v1, v3}, Landroid/provider/Settings$Secure;->isLocationProviderEnabled(Landroid/content/ContentResolver;Ljava/lang/String;)Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 392
    iget-object v2, p0, Lcom/android/settings/SecuritySettings;->mGps:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 393
    iget-object v2, p0, Lcom/android/settings/SecuritySettings;->mAssistedGps:Landroid/preference/CheckBoxPreference;

    if-eqz v2, :cond_0

    .line 394
    iget-object v2, p0, Lcom/android/settings/SecuritySettings;->mAssistedGps:Landroid/preference/CheckBoxPreference;

    const-string v3, "assisted_gps_enabled"

    const/4 v4, 0x2

    invoke-static {v1, v3, v4}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    if-ne v3, v5, :cond_1

    move v3, v5

    :goto_0
    invoke-virtual {v2, v3}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 396
    iget-object v2, p0, Lcom/android/settings/SecuritySettings;->mAssistedGps:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 398
    :cond_0
    return-void

    .line 394
    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 6
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 421
    invoke-super {p0, p1, p2, p3}, Landroid/preference/PreferenceActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 423
    const/16 v2, 0xc3

    if-ne v2, p1, :cond_0

    .line 425
    const/16 v2, 0x64

    sub-int v1, p2, v2

    .line 427
    .local v1, iResult:I
    sparse-switch v1, :sswitch_data_0

    .line 444
    const v2, 0x7f080580

    const/4 v3, 0x1

    :try_start_0
    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {p0, v2, v3}, Lcom/android/settings/SecuritySettings;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/settings/SecuritySettings;->toast(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 451
    .end local v1           #iResult:I
    :cond_0
    :goto_0
    :sswitch_0
    invoke-direct {p0}, Lcom/android/settings/SecuritySettings;->createPreferenceHierarchy()Landroid/preference/PreferenceScreen;

    .line 452
    return-void

    .line 430
    .restart local v1       #iResult:I
    :sswitch_1
    :try_start_1
    iget-object v2, p0, Lcom/android/settings/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {v2}, Lcom/android/internal/widget/LockPatternUtils;->savedFingerExists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 431
    iget-object v2, p0, Lcom/android/settings/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/android/internal/widget/LockPatternUtils;->setLockFingerEnabled(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 446
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 447
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 436
    .end local v0           #e:Ljava/lang/Exception;
    :sswitch_2
    const v2, 0x7f08057a

    :try_start_2
    invoke-virtual {p0, v2}, Lcom/android/settings/SecuritySettings;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/settings/SecuritySettings;->toast(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 427
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_1
        0x9 -> :sswitch_0
        0xe -> :sswitch_2
    .end sparse-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 23
    .parameter "savedInstanceState"

    .prologue
    .line 123
    invoke-super/range {p0 .. p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 125
    new-instance v5, Lcom/android/internal/widget/LockPatternUtils;

    move-object v0, v5

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/android/internal/widget/LockPatternUtils;-><init>(Landroid/content/Context;)V

    move-object v0, v5

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings/SecuritySettings;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    .line 127
    const-string v5, "device_policy"

    move-object/from16 v0, p0

    move-object v1, v5

    invoke-virtual {v0, v1}, Lcom/android/settings/SecuritySettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    .end local p1
    check-cast p1, Landroid/app/admin/DevicePolicyManager;

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings/SecuritySettings;->mDPM:Landroid/app/admin/DevicePolicyManager;

    .line 129
    new-instance v5, Lcom/android/settings/ChooseLockSettingsHelper;

    move-object v0, v5

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/android/settings/ChooseLockSettingsHelper;-><init>(Landroid/app/Activity;)V

    move-object v0, v5

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings/SecuritySettings;->mChooseLockSettingsHelper:Lcom/android/settings/ChooseLockSettingsHelper;

    .line 131
    invoke-direct/range {p0 .. p0}, Lcom/android/settings/SecuritySettings;->createPreferenceHierarchy()Landroid/preference/PreferenceScreen;

    .line 133
    invoke-direct/range {p0 .. p0}, Lcom/android/settings/SecuritySettings;->updateToggles()V

    .line 136
    const-string v5, "location_gps_source"

    move-object/from16 v0, p0

    move-object v1, v5

    invoke-virtual {v0, v1}, Lcom/android/settings/SecuritySettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v12

    check-cast v12, Landroid/preference/ListPreference;

    .line 137
    .local v12, btpref:Landroid/preference/ListPreference;
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 138
    .local v16, entries:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/CharSequence;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings/SecuritySettings;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f050038

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v11

    .local v11, arr$:[Ljava/lang/String;
    move-object v0, v11

    array-length v0, v0

    move/from16 v18, v0

    .local v18, len$:I
    const/16 v17, 0x0

    .local v17, i$:I
    :goto_0
    move/from16 v0, v17

    move/from16 v1, v18

    if-ge v0, v1, :cond_0

    aget-object v15, v11, v17

    .line 139
    .local v15, e:Ljava/lang/String;
    move-object/from16 v0, v16

    move-object v1, v15

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 138
    add-int/lit8 v17, v17, 0x1

    goto :goto_0

    .line 141
    .end local v15           #e:Ljava/lang/String;
    :cond_0
    new-instance v22, Ljava/util/ArrayList;

    invoke-direct/range {v22 .. v22}, Ljava/util/ArrayList;-><init>()V

    .line 142
    .local v22, values:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/CharSequence;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings/SecuritySettings;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f050039

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v11

    move-object v0, v11

    array-length v0, v0

    move/from16 v18, v0

    const/16 v17, 0x0

    :goto_1
    move/from16 v0, v17

    move/from16 v1, v18

    if-ge v0, v1, :cond_1

    aget-object v21, v11, v17

    .line 143
    .local v21, v:Ljava/lang/String;
    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 142
    add-int/lit8 v17, v17, 0x1

    goto :goto_1

    .line 146
    .end local v21           #v:Ljava/lang/String;
    :cond_1
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v19

    .line 147
    .local v19, mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;
    if-eqz v19, :cond_2

    invoke-virtual/range {v19 .. v19}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 148
    invoke-virtual/range {v19 .. v19}, Landroid/bluetooth/BluetoothAdapter;->getBondedDevices()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v17

    .local v17, i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/bluetooth/BluetoothDevice;

    .line 149
    .local v13, d:Landroid/bluetooth/BluetoothDevice;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v13}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 150
    .local v14, dname:Ljava/lang/String;
    move-object/from16 v0, v16

    move-object v1, v14

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 151
    invoke-virtual {v13}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v22

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 154
    .end local v13           #d:Landroid/bluetooth/BluetoothDevice;
    .end local v14           #dname:Ljava/lang/String;
    .end local v17           #i$:Ljava/util/Iterator;
    :cond_2
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v5

    new-array v5, v5, [Ljava/lang/CharSequence;

    move-object/from16 v0, v16

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/CharSequence;

    move-object v0, v12

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 155
    invoke-virtual/range {v22 .. v22}, Ljava/util/ArrayList;->size()I

    move-result v5

    new-array v5, v5, [Ljava/lang/CharSequence;

    move-object/from16 v0, v22

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/CharSequence;

    move-object v0, v12

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 156
    const-string v5, "0"

    invoke-virtual {v12, v5}, Landroid/preference/ListPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 157
    move-object v0, v12

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 161
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    sget-object v6, Landroid/provider/Settings$Secure;->CONTENT_URI:Landroid/net/Uri;

    const/4 v7, 0x0

    const-string v8, "(name=?)"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    const-string v11, "location_providers_allowed"

    .end local v11           #arr$:[Ljava/lang/String;
    aput-object v11, v9, v10

    const/4 v10, 0x0

    invoke-virtual/range {v5 .. v10}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v20

    .line 165
    .local v20, settingsCursor:Landroid/database/Cursor;
    new-instance v5, Landroid/content/ContentQueryMap;

    const-string v6, "name"

    const/4 v7, 0x1

    const/4 v8, 0x0

    move-object v0, v5

    move-object/from16 v1, v20

    move-object v2, v6

    move v3, v7

    move-object v4, v8

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/content/ContentQueryMap;-><init>(Landroid/database/Cursor;Ljava/lang/String;ZLandroid/os/Handler;)V

    move-object v0, v5

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/settings/SecuritySettings;->mContentQueryMap:Landroid/content/ContentQueryMap;

    .line 166
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/SecuritySettings;->mContentQueryMap:Landroid/content/ContentQueryMap;

    move-object v5, v0

    new-instance v6, Lcom/android/settings/SecuritySettings$SettingsObserver;

    const/4 v7, 0x0

    move-object v0, v6

    move-object/from16 v1, p0

    move-object v2, v7

    invoke-direct {v0, v1, v2}, Lcom/android/settings/SecuritySettings$SettingsObserver;-><init>(Lcom/android/settings/SecuritySettings;Lcom/android/settings/SecuritySettings$1;)V

    invoke-virtual {v5, v6}, Landroid/content/ContentQueryMap;->addObserver(Ljava/util/Observer;)V

    .line 167
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 7
    .parameter "preference"
    .parameter "newValue"

    .prologue
    const-string v6, "0"

    .line 171
    invoke-virtual {p0}, Lcom/android/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "0"

    invoke-static {v4, v6}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 173
    .local v3, oldPref:Ljava/lang/String;
    if-nez p2, :cond_2

    const-string v4, "0"

    move-object v2, v6

    .line 175
    .end local p2
    .local v2, newPref:Ljava/lang/String;
    :goto_0
    invoke-virtual {p0}, Lcom/android/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "0"

    invoke-static {v4, v6, v2}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 177
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "0"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "0"

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 178
    :cond_0
    const-string v4, "location"

    invoke-virtual {p0, v4}, Lcom/android/settings/SecuritySettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/location/LocationManager;

    .line 180
    .local v1, locationManager:Landroid/location/LocationManager;
    invoke-virtual {v1, v2}, Landroid/location/LocationManager;->setGPSSource(Ljava/lang/String;)V

    .line 183
    new-instance v4, Landroid/app/AlertDialog$Builder;

    invoke-direct {v4, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 184
    .local v0, alertDialog:Landroid/app/AlertDialog;
    const v4, 0x7f0802b0

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog;->setTitle(I)V

    .line 185
    invoke-virtual {p0}, Lcom/android/settings/SecuritySettings;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0802b1

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 186
    const/4 v4, -0x1

    invoke-virtual {p0}, Lcom/android/settings/SecuritySettings;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x104000a

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/android/settings/SecuritySettings$1;

    invoke-direct {v6, p0}, Lcom/android/settings/SecuritySettings$1;-><init>(Lcom/android/settings/SecuritySettings;)V

    invoke-virtual {v0, v4, v5, v6}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 193
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 195
    .end local v0           #alertDialog:Landroid/app/AlertDialog;
    .end local v1           #locationManager:Landroid/location/LocationManager;
    :cond_1
    const/4 v4, 0x1

    return v4

    .line 173
    .end local v2           #newPref:Ljava/lang/String;
    .restart local p2
    :cond_2
    check-cast p2, Ljava/lang/String;

    move-object v2, p2

    goto :goto_0
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 12
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 330
    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v4

    .line 331
    .local v4, key:Ljava/lang/String;
    iget-object v7, p0, Lcom/android/settings/SecuritySettings;->mChooseLockSettingsHelper:Lcom/android/settings/ChooseLockSettingsHelper;

    invoke-virtual {v7}, Lcom/android/settings/ChooseLockSettingsHelper;->utils()Lcom/android/internal/widget/LockPatternUtils;

    move-result-object v5

    .line 332
    .local v5, lockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;
    const-string v7, "unlock_set_or_change"

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 333
    new-instance v3, Landroid/content/Intent;

    const-class v7, Lcom/android/settings/ChooseLockGeneric;

    invoke-direct {v3, p0, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 334
    .local v3, intent:Landroid/content/Intent;
    const/16 v7, 0x7b

    invoke-virtual {p0, v3, v7}, Lcom/android/settings/SecuritySettings;->startActivityForResult(Landroid/content/Intent;I)V

    .line 380
    .end local v3           #intent:Landroid/content/Intent;
    :cond_0
    :goto_0
    return v10

    .line 335
    :cond_1
    const-string v7, "lockenabled"

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 336
    invoke-direct {p0, p2}, Lcom/android/settings/SecuritySettings;->isToggled(Landroid/preference/Preference;)Z

    move-result v7

    invoke-virtual {v5, v7}, Lcom/android/internal/widget/LockPatternUtils;->setLockPatternEnabled(Z)V

    goto :goto_0

    .line 337
    :cond_2
    const-string v7, "visiblepattern"

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 338
    invoke-direct {p0, p2}, Lcom/android/settings/SecuritySettings;->isToggled(Landroid/preference/Preference;)Z

    move-result v6

    .line 339
    .local v6, visible:Z
    invoke-virtual {v5, v6}, Lcom/android/internal/widget/LockPatternUtils;->setVisiblePatternEnabled(Z)V

    .line 340
    if-eqz v6, :cond_3

    .line 341
    invoke-virtual {v5, v11}, Lcom/android/internal/widget/LockPatternUtils;->setShowErrorPath(Z)V

    .line 343
    :cond_3
    iget-object v7, p0, Lcom/android/settings/SecuritySettings;->mShowErrorPath:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v5}, Lcom/android/internal/widget/LockPatternUtils;->isShowErrorPath()Z

    move-result v8

    invoke-virtual {v7, v8}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 344
    iget-object v7, p0, Lcom/android/settings/SecuritySettings;->mShowErrorPath:Landroid/preference/CheckBoxPreference;

    if-nez v6, :cond_4

    move v8, v11

    :goto_1
    invoke-virtual {v7, v8}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    goto :goto_0

    :cond_4
    move v8, v10

    goto :goto_1

    .line 345
    .end local v6           #visible:Z
    :cond_5
    const-string v7, "show_error_path"

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 346
    invoke-direct {p0, p2}, Lcom/android/settings/SecuritySettings;->isToggled(Landroid/preference/Preference;)Z

    move-result v7

    invoke-virtual {v5, v7}, Lcom/android/internal/widget/LockPatternUtils;->setShowErrorPath(Z)V

    goto :goto_0

    .line 347
    :cond_6
    const-string v7, "unlock_tactile_feedback"

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 348
    invoke-direct {p0, p2}, Lcom/android/settings/SecuritySettings;->isToggled(Landroid/preference/Preference;)Z

    move-result v7

    invoke-virtual {v5, v7}, Lcom/android/internal/widget/LockPatternUtils;->setTactileFeedbackEnabled(Z)V

    goto :goto_0

    .line 349
    :cond_7
    const-string v7, "start_database_administration"

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 351
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 352
    .restart local v3       #intent:Landroid/content/Intent;
    new-instance v0, Landroid/content/ComponentName;

    const-string v7, "com.authentec.TrueSuiteMobile"

    const-string v8, "com.authentec.TrueSuiteMobile.DatabaseAdministration"

    invoke-direct {v0, v7, v8}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 354
    .local v0, component:Landroid/content/ComponentName;
    invoke-virtual {v3, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 355
    const-string v7, "android.intent.action.MAIN"

    invoke-virtual {v3, v7}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 356
    const/16 v7, 0xc3

    invoke-virtual {p0, v3, v7}, Lcom/android/settings/SecuritySettings;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 357
    .end local v0           #component:Landroid/content/ComponentName;
    .end local v3           #intent:Landroid/content/Intent;
    :cond_8
    iget-object v7, p0, Lcom/android/settings/SecuritySettings;->mShowPassword:Landroid/preference/CheckBoxPreference;

    if-ne p2, v7, :cond_a

    .line 358
    invoke-virtual {p0}, Lcom/android/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    const-string v8, "show_password"

    iget-object v9, p0, Lcom/android/settings/SecuritySettings;->mShowPassword:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v9}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v9

    if-eqz v9, :cond_9

    move v9, v11

    :goto_2
    invoke-static {v7, v8, v9}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto/16 :goto_0

    :cond_9
    move v9, v10

    goto :goto_2

    .line 360
    :cond_a
    iget-object v7, p0, Lcom/android/settings/SecuritySettings;->mNetwork:Landroid/preference/CheckBoxPreference;

    if-ne p2, v7, :cond_b

    .line 361
    invoke-virtual {p0}, Lcom/android/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    const-string v8, "network"

    iget-object v9, p0, Lcom/android/settings/SecuritySettings;->mNetwork:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v9}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v9

    invoke-static {v7, v8, v9}, Landroid/provider/Settings$Secure;->setLocationProviderEnabled(Landroid/content/ContentResolver;Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 363
    :cond_b
    iget-object v7, p0, Lcom/android/settings/SecuritySettings;->mGps:Landroid/preference/CheckBoxPreference;

    if-ne p2, v7, :cond_c

    .line 364
    iget-object v7, p0, Lcom/android/settings/SecuritySettings;->mGps:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v7}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v1

    .line 365
    .local v1, enabled:Z
    invoke-virtual {p0}, Lcom/android/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    const-string v8, "gps"

    invoke-static {v7, v8, v1}, Landroid/provider/Settings$Secure;->setLocationProviderEnabled(Landroid/content/ContentResolver;Ljava/lang/String;Z)V

    .line 369
    new-instance v2, Landroid/content/Intent;

    const-string v7, "com.android.settings.GPS_STATUS_CHANGED"

    invoke-direct {v2, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 370
    .local v2, gpsStatus:Landroid/content/Intent;
    invoke-virtual {p0, v2}, Lcom/android/settings/SecuritySettings;->sendBroadcast(Landroid/content/Intent;)V

    .line 372
    iget-object v7, p0, Lcom/android/settings/SecuritySettings;->mAssistedGps:Landroid/preference/CheckBoxPreference;

    if-eqz v7, :cond_0

    .line 373
    iget-object v7, p0, Lcom/android/settings/SecuritySettings;->mAssistedGps:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v7, v1}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    goto/16 :goto_0

    .line 375
    .end local v1           #enabled:Z
    .end local v2           #gpsStatus:Landroid/content/Intent;
    :cond_c
    iget-object v7, p0, Lcom/android/settings/SecuritySettings;->mAssistedGps:Landroid/preference/CheckBoxPreference;

    if-ne p2, v7, :cond_0

    .line 376
    invoke-virtual {p0}, Lcom/android/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    const-string v8, "assisted_gps_enabled"

    iget-object v9, p0, Lcom/android/settings/SecuritySettings;->mAssistedGps:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v9}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v9

    if-eqz v9, :cond_d

    move v9, v11

    :goto_3
    invoke-static {v7, v8, v9}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto/16 :goto_0

    :cond_d
    move v9, v10

    goto :goto_3
.end method

.method protected onResume()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 305
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 307
    iget-object v2, p0, Lcom/android/settings/SecuritySettings;->mChooseLockSettingsHelper:Lcom/android/settings/ChooseLockSettingsHelper;

    invoke-virtual {v2}, Lcom/android/settings/ChooseLockSettingsHelper;->utils()Lcom/android/internal/widget/LockPatternUtils;

    move-result-object v0

    .line 308
    .local v0, lockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;
    iget-object v2, p0, Lcom/android/settings/SecuritySettings;->mVisiblePattern:Landroid/preference/CheckBoxPreference;

    if-eqz v2, :cond_1

    .line 309
    invoke-virtual {v0}, Lcom/android/internal/widget/LockPatternUtils;->isVisiblePatternEnabled()Z

    move-result v1

    .line 310
    .local v1, visible:Z
    iget-object v2, p0, Lcom/android/settings/SecuritySettings;->mVisiblePattern:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 311
    iget-object v2, p0, Lcom/android/settings/SecuritySettings;->mShowErrorPath:Landroid/preference/CheckBoxPreference;

    if-eqz v2, :cond_1

    .line 312
    iget-object v2, p0, Lcom/android/settings/SecuritySettings;->mShowErrorPath:Landroid/preference/CheckBoxPreference;

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lcom/android/internal/widget/LockPatternUtils;->isShowErrorPath()Z

    move-result v3

    if-eqz v3, :cond_3

    :cond_0
    move v3, v5

    :goto_0
    invoke-virtual {v2, v3}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 313
    iget-object v2, p0, Lcom/android/settings/SecuritySettings;->mShowErrorPath:Landroid/preference/CheckBoxPreference;

    if-nez v1, :cond_4

    move v3, v5

    :goto_1
    invoke-virtual {v2, v3}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 316
    .end local v1           #visible:Z
    :cond_1
    iget-object v2, p0, Lcom/android/settings/SecuritySettings;->mTactileFeedback:Landroid/preference/CheckBoxPreference;

    if-eqz v2, :cond_2

    .line 317
    iget-object v2, p0, Lcom/android/settings/SecuritySettings;->mTactileFeedback:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Lcom/android/internal/widget/LockPatternUtils;->isTactileFeedbackEnabled()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 320
    :cond_2
    iget-object v2, p0, Lcom/android/settings/SecuritySettings;->mShowPassword:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p0}, Lcom/android/settings/SecuritySettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "show_password"

    invoke-static {v3, v4, v5}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    if-eqz v3, :cond_5

    move v3, v5

    :goto_2
    invoke-virtual {v2, v3}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 323
    iget-object v2, p0, Lcom/android/settings/SecuritySettings;->mCredentialStorage:Lcom/android/settings/SecuritySettings$CredentialStorage;

    invoke-virtual {v2}, Lcom/android/settings/SecuritySettings$CredentialStorage;->resume()V

    .line 324
    return-void

    .restart local v1       #visible:Z
    :cond_3
    move v3, v6

    .line 312
    goto :goto_0

    :cond_4
    move v3, v6

    .line 313
    goto :goto_1

    .end local v1           #visible:Z
    :cond_5
    move v3, v6

    .line 320
    goto :goto_2
.end method
