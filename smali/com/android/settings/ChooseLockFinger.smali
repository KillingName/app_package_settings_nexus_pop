.class public Lcom/android/settings/ChooseLockFinger;
.super Landroid/preference/PreferenceActivity;
.source "ChooseLockFinger.java"


# static fields
.field private static final KEY_START_ENROLLMENT_WIZARD:Ljava/lang/String; = "start_enrollment_wizard"

.field private static final KEY_TOGGLE_UNLOCK_FINGER:Ljava/lang/String; = "toggle_unlock_finger"


# instance fields
.field private fingerhelper:Lcom/authentec/AuthentecHelper;

.field private mChooseLockFinger:Lcom/android/settings/ChooseLockFinger;

.field private mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

.field private mStartEnrollmentWizard:Landroid/preference/Preference;

.field private mToggleUnlockFinger:Landroid/preference/CheckBoxPreference;

.field private mbFingerSetting:Z

.field private miResult:I

.field private msTempPasscode:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 51
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/settings/ChooseLockFinger;->mbFingerSetting:Z

    .line 52
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/settings/ChooseLockFinger;->msTempPasscode:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/android/settings/ChooseLockFinger;)Lcom/android/settings/ChooseLockFinger;
    .locals 1
    .parameter "x0"

    .prologue
    .line 39
    iget-object v0, p0, Lcom/android/settings/ChooseLockFinger;->mChooseLockFinger:Lcom/android/settings/ChooseLockFinger;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/settings/ChooseLockFinger;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 39
    iget-object v0, p0, Lcom/android/settings/ChooseLockFinger;->msTempPasscode:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/settings/ChooseLockFinger;)Lcom/authentec/AuthentecHelper;
    .locals 1
    .parameter "x0"

    .prologue
    .line 39
    iget-object v0, p0, Lcom/android/settings/ChooseLockFinger;->fingerhelper:Lcom/authentec/AuthentecHelper;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/settings/ChooseLockFinger;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/android/settings/ChooseLockFinger;->toast(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lcom/android/settings/ChooseLockFinger;)Lcom/android/internal/widget/LockPatternUtils;
    .locals 1
    .parameter "x0"

    .prologue
    .line 39
    iget-object v0, p0, Lcom/android/settings/ChooseLockFinger;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/settings/ChooseLockFinger;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 39
    iget-boolean v0, p0, Lcom/android/settings/ChooseLockFinger;->mbFingerSetting:Z

    return v0
.end method

.method static synthetic access$600(Lcom/android/settings/ChooseLockFinger;)Landroid/preference/CheckBoxPreference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 39
    iget-object v0, p0, Lcom/android/settings/ChooseLockFinger;->mToggleUnlockFinger:Landroid/preference/CheckBoxPreference;

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/settings/ChooseLockFinger;)Landroid/preference/Preference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 39
    iget-object v0, p0, Lcom/android/settings/ChooseLockFinger;->mStartEnrollmentWizard:Landroid/preference/Preference;

    return-object v0
.end method

.method private startEnrollmentWizard()V
    .locals 2

    .prologue
    .line 129
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/android/settings/ChooseLockFinger$2;

    invoke-direct {v1, p0}, Lcom/android/settings/ChooseLockFinger$2;-><init>(Lcom/android/settings/ChooseLockFinger;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 180
    return-void
.end method

.method private startVerification()V
    .locals 2

    .prologue
    .line 185
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/android/settings/ChooseLockFinger$3;

    invoke-direct {v1, p0}, Lcom/android/settings/ChooseLockFinger$3;-><init>(Lcom/android/settings/ChooseLockFinger;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 214
    return-void
.end method

.method private toast(Ljava/lang/String;)V
    .locals 1
    .parameter "s"

    .prologue
    .line 118
    new-instance v0, Lcom/android/settings/ChooseLockFinger$1;

    invoke-direct {v0, p0, p1}, Lcom/android/settings/ChooseLockFinger$1;-><init>(Lcom/android/settings/ChooseLockFinger;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/android/settings/ChooseLockFinger;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 124
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 58
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 61
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/settings/ChooseLockFinger;->msTempPasscode:Ljava/lang/String;

    .line 64
    invoke-virtual {p0}, Lcom/android/settings/ChooseLockFinger;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 65
    .local v0, bundle:Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 66
    const-string v1, "temp-passcode"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/ChooseLockFinger;->msTempPasscode:Ljava/lang/String;

    .line 70
    :cond_0
    new-instance v1, Lcom/android/internal/widget/LockPatternUtils;

    invoke-direct {v1, p0}, Lcom/android/internal/widget/LockPatternUtils;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/settings/ChooseLockFinger;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    .line 71
    iput-object p0, p0, Lcom/android/settings/ChooseLockFinger;->mChooseLockFinger:Lcom/android/settings/ChooseLockFinger;

    .line 74
    invoke-static {p0}, Lcom/authentec/AuthentecHelper;->getInstance(Landroid/content/Context;)Lcom/authentec/AuthentecHelper;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/ChooseLockFinger;->fingerhelper:Lcom/authentec/AuthentecHelper;

    .line 76
    iget-object v1, p0, Lcom/android/settings/ChooseLockFinger;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {v1}, Lcom/android/internal/widget/LockPatternUtils;->savedFingerExists()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 78
    iput-boolean v3, p0, Lcom/android/settings/ChooseLockFinger;->mbFingerSetting:Z

    .line 80
    const v1, 0x7f040011

    invoke-virtual {p0, v1}, Lcom/android/settings/ChooseLockFinger;->addPreferencesFromResource(I)V

    .line 81
    const-string v1, "toggle_unlock_finger"

    invoke-virtual {p0, v1}, Lcom/android/settings/ChooseLockFinger;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/CheckBoxPreference;

    iput-object v1, p0, Lcom/android/settings/ChooseLockFinger;->mToggleUnlockFinger:Landroid/preference/CheckBoxPreference;

    .line 82
    iget-object v1, p0, Lcom/android/settings/ChooseLockFinger;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {v1}, Lcom/android/internal/widget/LockPatternUtils;->isLockFingerEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 83
    iget-object v1, p0, Lcom/android/settings/ChooseLockFinger;->mToggleUnlockFinger:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1, v3}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 87
    :goto_0
    const-string v1, "start_enrollment_wizard"

    invoke-virtual {p0, v1}, Lcom/android/settings/ChooseLockFinger;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/ChooseLockFinger;->mStartEnrollmentWizard:Landroid/preference/Preference;

    .line 88
    iget-object v1, p0, Lcom/android/settings/ChooseLockFinger;->mStartEnrollmentWizard:Landroid/preference/Preference;

    const v2, 0x7f080570

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setTitle(I)V

    .line 93
    :goto_1
    return-void

    .line 85
    :cond_1
    iget-object v1, p0, Lcom/android/settings/ChooseLockFinger;->mToggleUnlockFinger:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1, v2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    goto :goto_0

    .line 90
    :cond_2
    iput-boolean v2, p0, Lcom/android/settings/ChooseLockFinger;->mbFingerSetting:Z

    .line 91
    invoke-direct {p0}, Lcom/android/settings/ChooseLockFinger;->startEnrollmentWizard()V

    goto :goto_1
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 2
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    const/4 v1, 0x0

    .line 97
    iget-object v0, p0, Lcom/android/settings/ChooseLockFinger;->mToggleUnlockFinger:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_2

    .line 98
    iget-object v0, p0, Lcom/android/settings/ChooseLockFinger;->mToggleUnlockFinger:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 99
    invoke-direct {p0}, Lcom/android/settings/ChooseLockFinger;->startVerification()V

    .line 111
    :cond_0
    :goto_0
    invoke-super {p0, p1, p2}, Landroid/preference/PreferenceActivity;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v0

    return v0

    .line 102
    :cond_1
    iget-object v0, p0, Lcom/android/settings/ChooseLockFinger;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {v0, v1}, Lcom/android/internal/widget/LockPatternUtils;->setLockFingerEnabled(Z)V

    .line 103
    iget-object v0, p0, Lcom/android/settings/ChooseLockFinger;->mToggleUnlockFinger:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 105
    iget-object v0, p0, Lcom/android/settings/ChooseLockFinger;->mChooseLockFinger:Lcom/android/settings/ChooseLockFinger;

    invoke-virtual {v0}, Lcom/android/settings/ChooseLockFinger;->finish()V

    goto :goto_0

    .line 107
    :cond_2
    iget-object v0, p0, Lcom/android/settings/ChooseLockFinger;->mStartEnrollmentWizard:Landroid/preference/Preference;

    if-ne p2, v0, :cond_0

    .line 108
    invoke-direct {p0}, Lcom/android/settings/ChooseLockFinger;->startEnrollmentWizard()V

    goto :goto_0
.end method
