.class public Lcom/android/settings/ChooseLockGeneric;
.super Landroid/preference/PreferenceActivity;
.source "ChooseLockGeneric.java"


# static fields
.field private static final CONFIRM_CREDENTIALS:Ljava/lang/String; = "confirm_credentials"

.field private static final CONFIRM_EXISTING_REQUEST:I = 0x64

.field private static final KEY_UNLOCK_SET_FINGER:Ljava/lang/String; = "unlock_set_finger"

.field private static final KEY_UNLOCK_SET_NONE:Ljava/lang/String; = "unlock_set_none"

.field private static final KEY_UNLOCK_SET_PASSWORD:Ljava/lang/String; = "unlock_set_password"

.field private static final KEY_UNLOCK_SET_PATTERN:Ljava/lang/String; = "unlock_set_pattern"

.field private static final KEY_UNLOCK_SET_PIN:Ljava/lang/String; = "unlock_set_pin"

.field private static final MIN_PASSWORD_LENGTH:I = 0x4

.field private static final PASSWORD_CONFIRMED:Ljava/lang/String; = "password_confirmed"


# instance fields
.field private mChooseLockSettingsHelper:Lcom/android/settings/ChooseLockSettingsHelper;

.field private mDPM:Landroid/app/admin/DevicePolicyManager;

.field private mFingerprint:Landroid/view/View;

.field private mPasswordConfirmed:Z

.field private msTempPasscode:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 45
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/settings/ChooseLockGeneric;->mPasswordConfirmed:Z

    .line 46
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/settings/ChooseLockGeneric;->msTempPasscode:Ljava/lang/String;

    return-void
.end method

.method private disableUnusablePreferences(I)V
    .locals 12
    .parameter "quality"

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 140
    invoke-virtual {p0}, Lcom/android/settings/ChooseLockGeneric;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v8

    const-string v9, "security_picker_category"

    invoke-virtual {v8, v9}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v5

    .line 141
    .local v5, picker:Landroid/preference/Preference;
    move-object v0, v5

    check-cast v0, Landroid/preference/PreferenceCategory;

    move-object v1, v0

    .line 142
    .local v1, cat:Landroid/preference/PreferenceCategory;
    invoke-virtual {v1}, Landroid/preference/PreferenceCategory;->getPreferenceCount()I

    move-result v7

    .line 143
    .local v7, preferenceCount:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, v7, :cond_b

    .line 144
    invoke-virtual {v1, v3}, Landroid/preference/PreferenceCategory;->getPreference(I)Landroid/preference/Preference;

    move-result-object v6

    .line 145
    .local v6, pref:Landroid/preference/Preference;
    instance-of v8, v6, Landroid/preference/PreferenceScreen;

    if-eqz v8, :cond_1

    .line 146
    move-object v0, v6

    check-cast v0, Landroid/preference/PreferenceScreen;

    move-object v8, v0

    invoke-virtual {v8}, Landroid/preference/PreferenceScreen;->getKey()Ljava/lang/String;

    move-result-object v4

    .line 147
    .local v4, key:Ljava/lang/String;
    const/4 v2, 0x1

    .line 148
    .local v2, enabled:Z
    const-string v8, "unlock_set_none"

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 149
    if-gtz p1, :cond_2

    move v2, v11

    .line 159
    :cond_0
    :goto_1
    if-nez v2, :cond_1

    .line 160
    const v8, 0x7f0800fe

    invoke-virtual {v6, v8}, Landroid/preference/Preference;->setSummary(I)V

    .line 161
    invoke-virtual {v6, v10}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 143
    .end local v2           #enabled:Z
    .end local v4           #key:Ljava/lang/String;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .restart local v2       #enabled:Z
    .restart local v4       #key:Ljava/lang/String;
    :cond_2
    move v2, v10

    .line 149
    goto :goto_1

    .line 150
    :cond_3
    const-string v8, "unlock_set_pattern"

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 151
    const/high16 v8, 0x1

    if-gt p1, v8, :cond_4

    move v2, v11

    :goto_2
    goto :goto_1

    :cond_4
    move v2, v10

    goto :goto_2

    .line 152
    :cond_5
    const-string v8, "unlock_set_finger"

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 153
    const v8, 0x1ffff

    if-gt p1, v8, :cond_6

    move v2, v11

    :goto_3
    goto :goto_1

    :cond_6
    move v2, v10

    goto :goto_3

    .line 154
    :cond_7
    const-string v8, "unlock_set_pin"

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 155
    const/high16 v8, 0x2

    if-gt p1, v8, :cond_8

    move v2, v11

    :goto_4
    goto :goto_1

    :cond_8
    move v2, v10

    goto :goto_4

    .line 156
    :cond_9
    const-string v8, "unlock_set_password"

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 157
    const/high16 v8, 0x5

    if-gt p1, v8, :cond_a

    move v2, v11

    :goto_5
    goto :goto_1

    :cond_a
    move v2, v10

    goto :goto_5

    .line 165
    .end local v2           #enabled:Z
    .end local v4           #key:Ljava/lang/String;
    .end local v6           #pref:Landroid/preference/Preference;
    :cond_b
    return-void
.end method

.method private updatePreferencesOrFinish()V
    .locals 5

    .prologue
    const/4 v4, -0x1

    .line 119
    invoke-virtual {p0}, Lcom/android/settings/ChooseLockGeneric;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "lockscreen.password_type"

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 120
    .local v1, quality:I
    if-ne v1, v4, :cond_1

    .line 122
    iget-object v2, p0, Lcom/android/settings/ChooseLockGeneric;->mChooseLockSettingsHelper:Lcom/android/settings/ChooseLockSettingsHelper;

    invoke-virtual {v2}, Lcom/android/settings/ChooseLockSettingsHelper;->utils()Lcom/android/internal/widget/LockPatternUtils;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/widget/LockPatternUtils;->getKeyguardStoredPasswordQuality()I

    move-result v1

    .line 123
    invoke-virtual {p0}, Lcom/android/settings/ChooseLockGeneric;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    .line 124
    .local v0, prefScreen:Landroid/preference/PreferenceScreen;
    if-eqz v0, :cond_0

    .line 125
    invoke-virtual {v0}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 127
    :cond_0
    const v2, 0x7f040021

    invoke-virtual {p0, v2}, Lcom/android/settings/ChooseLockGeneric;->addPreferencesFromResource(I)V

    .line 128
    iget-object v2, p0, Lcom/android/settings/ChooseLockGeneric;->mDPM:Landroid/app/admin/DevicePolicyManager;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/app/admin/DevicePolicyManager;->getPasswordQuality(Landroid/content/ComponentName;)I

    move-result v2

    invoke-direct {p0, v2}, Lcom/android/settings/ChooseLockGeneric;->disableUnusablePreferences(I)V

    .line 132
    .end local v0           #prefScreen:Landroid/preference/PreferenceScreen;
    :goto_0
    return-void

    .line 130
    :cond_1
    invoke-virtual {p0, v1}, Lcom/android/settings/ChooseLockGeneric;->updateUnlockMethodAndFinish(I)V

    goto :goto_0
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 94
    invoke-super {p0, p1, p2, p3}, Landroid/preference/PreferenceActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 95
    const/16 v1, 0x64

    if-ne p1, v1, :cond_1

    const/4 v1, -0x1

    if-ne p2, v1, :cond_1

    .line 96
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/settings/ChooseLockGeneric;->mPasswordConfirmed:Z

    .line 97
    if-eqz p3, :cond_0

    .line 99
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 100
    .local v0, bundle:Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 101
    const-string v1, "temp-passcode"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/ChooseLockGeneric;->msTempPasscode:Ljava/lang/String;

    .line 104
    .end local v0           #bundle:Landroid/os/Bundle;
    :cond_0
    invoke-direct {p0}, Lcom/android/settings/ChooseLockGeneric;->updatePreferencesOrFinish()V

    .line 109
    :goto_0
    return-void

    .line 106
    :cond_1
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/android/settings/ChooseLockGeneric;->setResult(I)V

    .line 107
    invoke-virtual {p0}, Lcom/android/settings/ChooseLockGeneric;->finish()V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    const/4 v2, 0x0

    .line 51
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 53
    const-string v1, "device_policy"

    invoke-virtual {p0, v1}, Lcom/android/settings/ChooseLockGeneric;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/admin/DevicePolicyManager;

    iput-object v1, p0, Lcom/android/settings/ChooseLockGeneric;->mDPM:Landroid/app/admin/DevicePolicyManager;

    .line 54
    new-instance v1, Lcom/android/settings/ChooseLockSettingsHelper;

    invoke-direct {v1, p0}, Lcom/android/settings/ChooseLockSettingsHelper;-><init>(Landroid/app/Activity;)V

    iput-object v1, p0, Lcom/android/settings/ChooseLockGeneric;->mChooseLockSettingsHelper:Lcom/android/settings/ChooseLockSettingsHelper;

    .line 56
    if-eqz p1, :cond_0

    .line 57
    const-string v1, "password_confirmed"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/settings/ChooseLockGeneric;->mPasswordConfirmed:Z

    .line 60
    :cond_0
    iget-boolean v1, p0, Lcom/android/settings/ChooseLockGeneric;->mPasswordConfirmed:Z

    if-nez v1, :cond_2

    .line 61
    new-instance v0, Lcom/android/settings/ChooseLockSettingsHelper;

    invoke-direct {v0, p0}, Lcom/android/settings/ChooseLockSettingsHelper;-><init>(Landroid/app/Activity;)V

    .line 62
    .local v0, helper:Lcom/android/settings/ChooseLockSettingsHelper;
    const/16 v1, 0x64

    invoke-virtual {v0, v1, v2, v2}, Lcom/android/settings/ChooseLockSettingsHelper;->launchConfirmationActivity(ILjava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 63
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/settings/ChooseLockGeneric;->mPasswordConfirmed:Z

    .line 64
    invoke-direct {p0}, Lcom/android/settings/ChooseLockGeneric;->updatePreferencesOrFinish()V

    .line 69
    .end local v0           #helper:Lcom/android/settings/ChooseLockSettingsHelper;
    :cond_1
    :goto_0
    return-void

    .line 67
    :cond_2
    invoke-direct {p0}, Lcom/android/settings/ChooseLockGeneric;->updatePreferencesOrFinish()V

    goto :goto_0
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 3
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    .line 74
    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    .line 75
    .local v1, key:Ljava/lang/String;
    const/4 v0, 0x1

    .line 76
    .local v0, handled:Z
    const-string v2, "unlock_set_none"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 77
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/android/settings/ChooseLockGeneric;->updateUnlockMethodAndFinish(I)V

    .line 89
    :goto_0
    return v0

    .line 78
    :cond_0
    const-string v2, "unlock_set_pattern"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 79
    const/high16 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/android/settings/ChooseLockGeneric;->updateUnlockMethodAndFinish(I)V

    goto :goto_0

    .line 80
    :cond_1
    const-string v2, "unlock_set_finger"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 81
    const v2, 0x1ffff

    invoke-virtual {p0, v2}, Lcom/android/settings/ChooseLockGeneric;->updateUnlockMethodAndFinish(I)V

    goto :goto_0

    .line 82
    :cond_2
    const-string v2, "unlock_set_pin"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 83
    const/high16 v2, 0x2

    invoke-virtual {p0, v2}, Lcom/android/settings/ChooseLockGeneric;->updateUnlockMethodAndFinish(I)V

    goto :goto_0

    .line 84
    :cond_3
    const-string v2, "unlock_set_password"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 85
    const/high16 v2, 0x4

    invoke-virtual {p0, v2}, Lcom/android/settings/ChooseLockGeneric;->updateUnlockMethodAndFinish(I)V

    goto :goto_0

    .line 87
    :cond_4
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 113
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 115
    const-string v0, "password_confirmed"

    iget-boolean v1, p0, Lcom/android/settings/ChooseLockGeneric;->mPasswordConfirmed:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 116
    return-void
.end method

.method updateUnlockMethodAndFinish(I)V
    .locals 11
    .parameter "quality"

    .prologue
    const/4 v9, 0x0

    const/high16 v8, 0x200

    const/4 v7, 0x0

    const-string v10, "confirm_credentials"

    .line 176
    iget-boolean v5, p0, Lcom/android/settings/ChooseLockGeneric;->mPasswordConfirmed:Z

    if-nez v5, :cond_0

    .line 177
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "Tried to update password without confirming first"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 181
    :cond_0
    iget-object v5, p0, Lcom/android/settings/ChooseLockGeneric;->mDPM:Landroid/app/admin/DevicePolicyManager;

    invoke-virtual {v5, v9}, Landroid/app/admin/DevicePolicyManager;->getPasswordQuality(Landroid/content/ComponentName;)I

    move-result v3

    .line 182
    .local v3, minQuality:I
    if-ge p1, v3, :cond_1

    .line 183
    move p1, v3

    .line 185
    :cond_1
    const/high16 v5, 0x2

    if-lt p1, v5, :cond_4

    .line 186
    iget-object v5, p0, Lcom/android/settings/ChooseLockGeneric;->mDPM:Landroid/app/admin/DevicePolicyManager;

    invoke-virtual {v5, v9}, Landroid/app/admin/DevicePolicyManager;->getPasswordMinimumLength(Landroid/content/ComponentName;)I

    move-result v2

    .line 187
    .local v2, minLength:I
    const/4 v5, 0x4

    if-ge v2, v5, :cond_2

    .line 188
    const/4 v2, 0x4

    .line 190
    :cond_2
    iget-object v5, p0, Lcom/android/settings/ChooseLockGeneric;->mDPM:Landroid/app/admin/DevicePolicyManager;

    invoke-virtual {v5, p1}, Landroid/app/admin/DevicePolicyManager;->getPasswordMaximumLength(I)I

    move-result v1

    .line 191
    .local v1, maxLength:I
    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5}, Landroid/content/Intent;-><init>()V

    const-class v6, Lcom/android/settings/ChooseLockPassword;

    invoke-virtual {v5, p0, v6}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object v0

    .line 192
    .local v0, intent:Landroid/content/Intent;
    const-string v5, "lockscreen.password_type"

    invoke-virtual {v0, v5, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 193
    const-string v5, "lockscreen.password_min"

    invoke-virtual {v0, v5, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 194
    const-string v5, "lockscreen.password_max"

    invoke-virtual {v0, v5, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 195
    const-string v5, "confirm_credentials"

    invoke-virtual {v0, v10, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 196
    invoke-virtual {v0, v8}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 197
    invoke-virtual {p0, v0}, Lcom/android/settings/ChooseLockGeneric;->startActivity(Landroid/content/Intent;)V

    .line 224
    .end local v0           #intent:Landroid/content/Intent;
    .end local v1           #maxLength:I
    .end local v2           #minLength:I
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lcom/android/settings/ChooseLockGeneric;->finish()V

    .line 225
    return-void

    .line 198
    :cond_4
    const v5, 0x1ffff

    if-ne p1, v5, :cond_6

    .line 199
    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5}, Landroid/content/Intent;-><init>()V

    const-class v6, Lcom/android/settings/ChooseLockFinger;

    invoke-virtual {v5, p0, v6}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object v0

    .line 200
    .restart local v0       #intent:Landroid/content/Intent;
    invoke-virtual {v0, v8}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 202
    iget-object v5, p0, Lcom/android/settings/ChooseLockGeneric;->msTempPasscode:Ljava/lang/String;

    if-eqz v5, :cond_5

    .line 204
    const-string v5, "temp-passcode"

    iget-object v6, p0, Lcom/android/settings/ChooseLockGeneric;->msTempPasscode:Ljava/lang/String;

    invoke-virtual {v0, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 206
    iput-object v9, p0, Lcom/android/settings/ChooseLockGeneric;->msTempPasscode:Ljava/lang/String;

    .line 208
    :cond_5
    const-string v5, "confirm_credentials"

    invoke-virtual {v0, v10, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 209
    invoke-virtual {p0, v0}, Lcom/android/settings/ChooseLockGeneric;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 210
    .end local v0           #intent:Landroid/content/Intent;
    :cond_6
    const/high16 v5, 0x1

    if-ne p1, v5, :cond_9

    .line 211
    iget-object v5, p0, Lcom/android/settings/ChooseLockGeneric;->mChooseLockSettingsHelper:Lcom/android/settings/ChooseLockSettingsHelper;

    invoke-virtual {v5}, Lcom/android/settings/ChooseLockSettingsHelper;->utils()Lcom/android/internal/widget/LockPatternUtils;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/internal/widget/LockPatternUtils;->isPatternEverChosen()Z

    move-result v5

    if-nez v5, :cond_7

    const/4 v5, 0x1

    move v4, v5

    .line 212
    .local v4, showTutorial:Z
    :goto_1
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 213
    .restart local v0       #intent:Landroid/content/Intent;
    if-eqz v4, :cond_8

    const-class v5, Lcom/android/settings/ChooseLockPatternTutorial;

    :goto_2
    invoke-virtual {v0, p0, v5}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 216
    invoke-virtual {v0, v8}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 217
    const-string v5, "key_lock_method"

    const-string v6, "pattern"

    invoke-virtual {v0, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 218
    const-string v5, "confirm_credentials"

    invoke-virtual {v0, v10, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 219
    invoke-virtual {p0, v0}, Lcom/android/settings/ChooseLockGeneric;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .end local v0           #intent:Landroid/content/Intent;
    .end local v4           #showTutorial:Z
    :cond_7
    move v4, v7

    .line 211
    goto :goto_1

    .line 213
    .restart local v0       #intent:Landroid/content/Intent;
    .restart local v4       #showTutorial:Z
    :cond_8
    const-class v5, Lcom/android/settings/ChooseLockPattern;

    goto :goto_2

    .line 220
    .end local v0           #intent:Landroid/content/Intent;
    .end local v4           #showTutorial:Z
    :cond_9
    if-nez p1, :cond_3

    .line 221
    iget-object v5, p0, Lcom/android/settings/ChooseLockGeneric;->mChooseLockSettingsHelper:Lcom/android/settings/ChooseLockSettingsHelper;

    invoke-virtual {v5}, Lcom/android/settings/ChooseLockSettingsHelper;->utils()Lcom/android/internal/widget/LockPatternUtils;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/internal/widget/LockPatternUtils;->clearLock()V

    .line 222
    const/4 v5, -0x1

    invoke-virtual {p0, v5}, Lcom/android/settings/ChooseLockGeneric;->setResult(I)V

    goto :goto_0
.end method
